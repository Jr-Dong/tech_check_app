import 'package:flutter/material.dart';
import 'package:tech_check_app/core/app_colors.dart';
import 'package:tech_check_app/core/fonts.dart';

class ProductImagePickerSection extends StatelessWidget {
  const ProductImagePickerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 80,
          child: ListView(
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            children: [
              ImageAddButton(currentCount: 4),
              SizedBox(width: 12),
              ProductImageItem(isMain: true),
              SizedBox(width: 12),
              ProductImageItem(isMain: false),
              SizedBox(width: 12),
              ProductImageItem(isMain: false),
              SizedBox(width: 12),
              ProductImageItem(isMain: false),
            ],
          ),
        ),
        SizedBox(height: 12),
        Text(
          "* 첫 번째 사진이 대표 사진입니다.",
          style: AppTextStyles.s11w500.copyWith(color: AppColors.gray400),
        ),
      ],
    );
  }
}

class ImageAddButton extends StatelessWidget {
  final int currentCount;

  const ImageAddButton({super.key, this.currentCount = 0});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 80,
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: AppColors.border, width: 1),
          foregroundColor: AppColors.gray400,
        ),
        child: Column(
          children: [
            Icon(Icons.camera_alt, size: 32),
            Text("$currentCount/10"),
          ],
        ),
      ),
    );
  }
}

class ProductImageItem extends StatelessWidget {
  final bool isMain;

  const ProductImageItem({super.key, this.isMain = false});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: SizedBox(
            width: 80,
            height: 80,
            child: Image.network('http://picsum.photos/80'),
          ),
        ),
        Positioned(
          top: -4,
          right: -4,
          child: Container(
            width: 20,
            height: 20,
            decoration: const BoxDecoration(
              color: AppColors.textPrimary,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () {},
              icon: const Icon(
                Icons.close_rounded,
                color: Colors.white,
                size: 16,
              ),
            ),
          ),
        ),
        if (isMain)
          Positioned(
            bottom: 4,
            left: 4,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              decoration: BoxDecoration(
                color: AppColors.secondary500,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                "대표",
                style: AppTextStyles.s11w500.copyWith(color: Colors.white),
              ),
            ),
          ),
      ],
    );
  }
}
