import 'package:flutter/material.dart';
import 'package:tech_check_app/core/app_colors.dart';
import 'package:tech_check_app/core/fonts.dart';

class ProductImagePickerSection extends StatelessWidget {
  final List<String> productImages;
  final void Function(String)? onImageAdd;
  final void Function(String)? onRemoveImage;

  const ProductImagePickerSection({
    super.key,
    required this.productImages,
    required this.onImageAdd,
    required this.onRemoveImage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 80,
          // LitView.seperated 리팩토링 추천!
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            itemCount: productImages.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: ImageAddButton(
                    currentCount: productImages.length,
                    onImageAdd: onImageAdd,
                  ),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: ProductImageItem(
                    isMain: index == 1,
                    imageUrl: productImages[index - 1],
                    onRemoveImage: onRemoveImage,
                  ),
                );
              }
            },
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
  final void Function(String)? onImageAdd;
  const ImageAddButton({
    super.key,
    this.currentCount = 0,
    required this.onImageAdd,
  });

  @override
  Widget build(BuildContext context) {
    final int timestamp = DateTime.now().millisecondsSinceEpoch;

    return SizedBox(
      width: 80,
      height: 80,
      child: OutlinedButton(
        onPressed: currentCount >= 10
            ? null
            : () {
                if (onImageAdd != null && currentCount < 10) {
                  onImageAdd!("https://picsum.photos/300/300?seed=$timestamp");
                }
              },
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
  final String imageUrl;
  final void Function(String)? onRemoveImage;

  const ProductImageItem({
    super.key,
    required this.imageUrl,
    this.isMain = false,
    required this.onRemoveImage,
  });

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
            child: Image.network(imageUrl, fit: BoxFit.cover),
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
              onPressed: () {
                onRemoveImage?.call(imageUrl);
              },
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
