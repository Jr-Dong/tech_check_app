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
  final _formKey = GlobalKey<FormState>();

  final TextEditingController titleController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      Navigator.pop(context);
      SnackBar snackBar = SnackBar(
        behavior: SnackBarBehavior.floating,
        content: Text("상품이 성공적으로 등록되었습니다!"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
                onPressed: () {
                  _submitForm();
                },
                child: const Text("등록하기"),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                ProductImagePickerSection(),
                SizedBox(height: 18),
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
