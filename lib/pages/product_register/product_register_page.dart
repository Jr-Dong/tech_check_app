import 'package:flutter/material.dart';
import 'package:tech_check_app/core/app_colors.dart';
import 'package:tech_check_app/core/fonts.dart';
import 'package:tech_check_app/pages/product_register/widgets/form_field_section.dart';
import 'package:tech_check_app/pages/product_register/widgets/price_form_field_section.dart';
import 'package:tech_check_app/pages/product_register/widgets/product_image_picker_section.dart';

// 상품 등록 페이지
class ProductRegister extends StatefulWidget {
  const ProductRegister({super.key});

  @override
  State<ProductRegister> createState() => _ProductRegisterState();
}

class _ProductRegisterState extends State<ProductRegister> {
  // Form의 전체 상태(검증)을 관리하기 위한 키
  final _formKey = GlobalKey<FormState>();

  // 각 TextformField의 컨트롤러
  final TextEditingController titleController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  List<String> pruductImages = [];

  // 등록 버튼 클릭시 실행되는 함수
  // 모든 FormField의 유효성 검사를 수행하고,
  // 유효성 검사를 통과하면 이전 화면으로 돌아가고 스낵바를 표시
  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      if (pruductImages.isEmpty) {
        // 이미지가 없으면 스낵바 띄우고 종료
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text("상품 이미지를 최소 1장 등록해주세요!"),
          ),
        );
        return;
      }
      // 현재 페이지 닫기
      Navigator.pop(context);

      // snackbar 띄우기
      SnackBar snackBar = SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text("상품이 성공적으로 등록되었습니다!"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  void addImage(String imagePath) {
    setState(() {
      pruductImages.add(imagePath);
    });
  }

  void removeImage(String imagePath) {
    setState(() {
      pruductImages.remove(imagePath);
    });
  }

  @override
  void dispose() {
    // 컨트롤러 해제
    titleController.dispose();
    priceController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // 빈 공간 터치시 키보드 닫기
      behavior: HitTestBehavior.translucent,
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(title: Text("내 물건 팔기")),
        resizeToAvoidBottomInset: false,

        // 하단 고정 등록하기 버튼
        bottomNavigationBar: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  _submitForm();
                },
                child: const Text("등록하기"),
              ),
            ),
          ),
        ),

        // 입력 폼 영역
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // 상품 이미지 영역
                ProductImagePickerSection(
                  productImages: pruductImages,
                  onImageAdd: addImage,
                  onRemoveImage: removeImage,
                ),
                SizedBox(height: 18),

                // 상품 제목 입력
                FormFieldSection(
                  controller: titleController,
                  label: "제목",
                  hint: "상품명을 입력해주세요",
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "상품명을 입력해주세요";
                    }
                    if (value.length < 2) return "상품명은 최소 2자 이상이어야 합니다";
                    return null;
                  },
                ),
                SizedBox(height: 18),

                // 상품 가격 입력
                PriceFormFieldSection(
                  controller: priceController,
                  label: "가격",
                  hint: "가격을 입력하세요",
                  validator: (value) {
                    if (value == null || value.isEmpty) return "가격을 입력해주세요";
                    return null;
                  },
                ),
                SizedBox(height: 18),

                // 상세 설명 입력
                Column(
                  children: [
                    FormFieldSection(
                      controller: descriptionController,
                      label: "자세한 설명",
                      hint:
                          "- 브랜드, 모델명, 구매 시기, 사용 기간, 하자 유무를 작성해주세요\n\n"
                          "- 정확한 정보일수록 빠른 거래에 도움이 됩니다",
                      minLines: 4,
                      maxLines: 7,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "설명을 입력해주세요";
                        }
                        if (value.length < 10) {
                          return "설명은 최소 10자 이상이어야 합니다";
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: Text(
                        "* 판매 금지 품목은 게시가 제한될 수 있어요.",
                        style: AppTextStyles.s11w500.copyWith(
                          color: AppColors.gray400,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
