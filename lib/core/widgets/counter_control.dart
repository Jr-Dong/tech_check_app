import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tech_check_app/core/app_colors.dart';

class CounterControl extends StatefulWidget {
  const CounterControl({
    super.key,
    required this.count,
    required this.countUp,
    required this.countDown,
  });

  final int count;
  final VoidCallback countUp;
  final void Function() countDown;

  @override
  State<CounterControl> createState() => _CounterControlState();
}

class _CounterControlState extends State<CounterControl> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: widget.count <= 1 ? null : () => widget.countDown(),

          icon: const Icon(CupertinoIcons.minus_circle),
          iconSize: 26,
          padding: EdgeInsets.zero,
          visualDensity: VisualDensity.compact,
          constraints: const BoxConstraints(),
          color: AppColors.gray400,
        ),
        SizedBox(width: 8),
        Text('${widget.count}'),
        SizedBox(width: 8),
        IconButton(
          onPressed: widget.count >= 99 ? null : () => widget.countUp(),
          icon: const Icon(CupertinoIcons.plus_circle),
          iconSize: 26,
          padding: EdgeInsets.zero,
          visualDensity: VisualDensity.compact,
          constraints: const BoxConstraints(),
          color: AppColors.gray400,
        ),
      ],
    );
  }
}
