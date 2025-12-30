import 'package:flutter/material.dart';
import 'package:tech_check_app/core/app_colors.dart';
import 'package:tech_check_app/core/fonts.dart';

class CartSelectionHeader extends StatelessWidget {
  final int selectedCount;
  final int totalCount;
  final bool isAllSelected;
  const CartSelectionHeader({
    super.key,
    required this.selectedCount,
    required this.totalCount,
    required this.isAllSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.border)),
      ),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Row(
        children: [
          Row(
            children: [
              Icon(
                isAllSelected ? Icons.check_box : Icons.check_box_outline_blank,
                color: AppColors.border,
              ),
              SizedBox(width: 9),
              Text(
                '전체 선택 ($selectedCount/$totalCount)',
                style: AppTextStyles.s11w500.copyWith(color: AppColors.gray400),
              ),
            ],
          ),
          Spacer(),
          Text(
            '선택 삭제',
            style: AppTextStyles.s11w500.copyWith(color: AppColors.textPrimary),
          ),
        ],
      ),
    );
  }
}
