import 'package:flutter/material.dart';
import 'package:tech_check_app/core/fonts.dart';

class ProductListItem extends StatefulWidget {
  @override
  State<ProductListItem> createState() => _ProductListItemState();
}

class _ProductListItemState extends State<ProductListItem> {
  Map<int, bool> favoriteMap = {};
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 15,
        childAspectRatio: 0.75,
      ),
      itemCount: 8,
      itemBuilder: (context, index) {
        bool isFavorite = favoriteMap[index] ?? false;
        return Container(
          decoration: BoxDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 이미지
              ClipRRect(
                borderRadius: BorderRadiusGeometry.all(Radius.circular(8)),
                child: Stack(
                  children: [
                    Image.network(
                      "https://picsum.photos/200?random=$index",
                      fit: BoxFit.cover,
                    ),

                    // 이미지 속 하트버튼
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            favoriteMap[index] = !isFavorite;
                          });
                        },
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_outline,
                          color: isFavorite
                              ? Colors.pinkAccent.shade100
                              : Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "맥북",
                style: AppTextStyles.s18w500,
                textAlign: TextAlign.start,
              ),
              Text(
                "800,000원",
                style: AppTextStyles.s18w600,
                textAlign: TextAlign.start,
              ),
            ],
          ),
        );
      },
    );
  }
}
