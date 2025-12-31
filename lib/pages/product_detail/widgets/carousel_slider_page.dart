import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tech_check_app/core/app_colors.dart';

class CarouselSliderPage extends StatefulWidget {
  final List<String> imageUrl;
  const CarouselSliderPage({super.key, required this.imageUrl});

  @override
  State<CarouselSliderPage> createState() => _CarouselSliderPageState();
}

class _CarouselSliderPageState extends State<CarouselSliderPage> {
  final CarouselSliderController carouselController =
      CarouselSliderController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          carouselController: carouselController,
          options: CarouselOptions(
            height: 350,
            viewportFraction: 1,
            enableInfiniteScroll: false,
            onPageChanged: ((index, reason) {
              setState(() {
                currentIndex = index;
              });
            }),
          ),
          items: widget.imageUrl.map((String item) {
            return SizedBox(
              width: double.infinity,
              child: Image.network(item, fit: BoxFit.cover),
            );
          }).toList(),
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: widget.imageUrl.asMap().entries.map((entry) {
                return Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: () {
                      carouselController.animateToPage(entry.key);
                    },
                    child: Container(
                      width: 8,
                      height: 8,
                      margin: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 5,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.background.withValues(
                          alpha: currentIndex == entry.key ? 0.9 : 0.2,
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
