import 'package:flutter/material.dart';
import 'package:tech_check_app/core/app_colors.dart';
import 'package:tech_check_app/core/fonts.dart';

class ProductRegister extends StatelessWidget {
  const ProductRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("내 물건 팔기")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            OutlinedButton(
              onPressed: () {},
              style: ButtonStyle(
                foregroundColor: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.disabled)) {
                    return AppColors.border;
                  }
                  return AppColors.gray400;
                }),
                side: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.disabled)) {
                    return BorderSide(color: AppColors.border);
                  }
                  return BorderSide(color: AppColors.border);
                }),
              ),
              child: Column(
                children: [Icon(Icons.camera_alt, size: 32), Text("사진")],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [Text("제목"), TextField()],
            ),
          ],
        ),
      ),
    );
  }
}
