import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:tech_check_app/core/app_colors.dart';

void main() {
  runApp(const MaterialApp(home: Scaffold(body: CarouselSliderPage())));
}

class CarouselSliderPage extends StatefulWidget {
  const CarouselSliderPage({super.key});

  @override
  State<CarouselSliderPage> createState() => _CarouselSliderPageState();
}

class _CarouselSliderPageState extends State<CarouselSliderPage> {
  final List<String> imgUrls = [
    'https://picsum.photos/id/158/200/300',
    'https://picsum.photos/id/168/200/300',
    'https://picsum.photos/id/178/200/300',
    'https://picsum.photos/id/188/200/300',
    'https://picsum.photos/id/198/200/300',
  ];

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
            height: 300,
            viewportFraction: 0.8,
            onPageChanged: ((index, reason) {
              setState(() {
                currentIndex = index;
              });
            }),
          ),
          items: imgUrls.map((String item) {
            return Image.network(item, fit: BoxFit.cover);
          }).toList(),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgUrls.asMap().entries.map((entry) {
              return Align(
                alignment: Alignment.bottomCenter,
                child: GestureDetector(
                  onTap: () {
                    carouselController.animateToPage(entry.key);
                  },
                  child: Container(
                    width: 10,
                    height: 10,
                    margin: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 4,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.textPrimary.withValues(
                        alpha: currentIndex == entry.key ? 0.9 : 0.2,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
