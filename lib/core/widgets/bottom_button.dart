import 'package:flutter/material.dart';
import 'package:tech_check_app/core/app_colors.dart';

class BottomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool hasShadow;

  const BottomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.hasShadow = true,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: hasShadow
            ? BoxDecoration(
                color: AppColors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, -4),
                  ),
                ],
              )
            : BoxDecoration(color: AppColors.white),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(onPressed: onPressed, child: Text(text)),
        ),
      ),
    );
  }
}
