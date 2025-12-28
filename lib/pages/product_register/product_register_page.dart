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
            Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 80,
                      height: 80,
                      child: OutlinedButton(
                        onPressed: () {},
                        style: ButtonStyle(),
                        child: Column(
                          children: [
                            Icon(Icons.camera_alt, size: 32),
                            Text("0/10"),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: SizedBox(
                            width: 80,
                            height: 80,
                            child: Image.network('http://picsum.photos/80'),
                          ),
                        ),
                        Icon(Icons.cancel),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text("제목", style: AppTextStyles.s16w400),
                ),
                TextField(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
