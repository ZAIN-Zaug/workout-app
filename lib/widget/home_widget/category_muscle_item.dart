import 'package:flutter/material.dart';

import '../../theme/color.dart';

class CategoryMuscleItem extends StatelessWidget {
  const CategoryMuscleItem({
    super.key,
    required this.isSelected,
    required this.group,
  });

  final bool isSelected;
  final String group;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.accent : AppColors.surface,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Text(
        group,
        style: TextStyle(
          color: isSelected ? AppColors.background : AppColors.textSecondary,
          fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
          fontFamily: 'Tajawal',
        ),
      ),
    );
  }
}
