import 'package:flutter/material.dart';
import 'package:tech_check_app/core/app_colors.dart';
import 'package:tech_check_app/core/fonts.dart';

class CommonEmptyListItem extends StatelessWidget {
  final String? imagePath;
  final IconData? icon;
  final double visualSize;

  final String title;
  final String description;

  const CommonEmptyListItem({
    super.key,
    this.imagePath,
    this.icon,
    this.visualSize = 190,
    required this.title,
    required this.description,
  }) : assert(
         imagePath != null || icon != null,
         'imagePath 또는 icon 중 하나는 반드시 필요합니다.',
       );

  @override
  Widget build(BuildContext context) {
    final Widget visualWidget = imagePath != null
        ? Image.asset(imagePath!, height: visualSize)
        : Container(
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
              color: AppColors.background,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: visualSize * 0.5, color: AppColors.gray400),
          );

    return Center(
      child: Column(
        children: [
          const Spacer(flex: 1),

          visualWidget,

          const SizedBox(height: 12),

          Text(
            title,
            style: AppTextStyles.s20w600.copyWith(color: AppColors.textPrimary),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 4),

          Text(
            description,
            style: AppTextStyles.s18w500.copyWith(color: AppColors.gray400),
            textAlign: TextAlign.center,
          ),

          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
