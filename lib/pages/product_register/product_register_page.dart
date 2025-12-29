import 'package:flutter/material.dart';
import 'package:tech_check_app/core/app_colors.dart';
import 'package:tech_check_app/core/fonts.dart';
import 'package:tech_check_app/pages/product_register/widgets/form_field_section.dart';
import 'package:tech_check_app/pages/product_register/widgets/price_form_field_section.dart';
import 'package:tech_check_app/pages/product_register/widgets/product_image_picker_section.dart';

class ProductRegister extends StatefulWidget {
  const ProductRegister({super.key});

  @override
  State<ProductRegister> createState() => _ProductRegisterState();
}

class _ProductRegisterState extends State<ProductRegister> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();

    // 값이 바뀔 때마다 버튼 활성화 체크
    titleController.addListener(_checkForm);
    priceController.addListener(_checkForm);
    descriptionController.addListener(_checkForm);
  }

  void _checkForm() {
    final isFilled =
        titleController.text.isNotEmpty &&
        priceController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty;

    if (isButtonEnabled != isFilled) {
      setState(() {
        isButtonEnabled = isFilled;
      });
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    priceController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(title: Text("내 물건 팔기")),
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: isButtonEnabled
                    ? () {
                        // 등록 처리
                      }
                    : null, // null이면 비활성화
                child: const Text("등록하기"),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              ProductImagePickerSection(),
              SizedBox(height: 18),
              FormFieldSection(
                controller: titleController,
                label: "제목",
                hint: "상품명을 입력해주세요",
              ),
              SizedBox(height: 18),
              PriceFormFieldSection(
                controller: priceController,
                label: "가격",
                hint: "가격을 입력하세요",
              ),
              SizedBox(height: 18),
              Column(
                children: [
                  FormFieldSection(
                    controller: descriptionController,
                    label: "자세한 설명",
                    hint:
                        "- 브랜드, 모델명, 구매 시기, 사용 기간, 하자 유무를 작성해주세요\n\n"
                        "- 정확한 정보일수록 빠른 거래에 도움이 됩니다",
                    minLines: 5,
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
    );
  }
}
