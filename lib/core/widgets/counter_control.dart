import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_check_app/core/app_colors.dart';

class CounterControl extends StatelessWidget {
  final int count;

  const CounterControl({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(CupertinoIcons.minus_circle),
          iconSize: 26,
          color: AppColors.gray400,
        ),
        SizedBox(width: 14),
        Text("$count"),
        SizedBox(width: 14),
        IconButton(
          onPressed: () {},
          icon: const Icon(CupertinoIcons.plus_circle),
          iconSize: 26,
          color: AppColors.gray400,
        ),
      ],
    );
  }
}
