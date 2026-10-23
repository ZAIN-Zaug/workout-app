import 'package:flutter/material.dart';

import '../../theme/color.dart';

class TitleAndTag extends StatelessWidget {
  const TitleAndTag({super.key, required this.title, required this.tag});
  final String title, tag;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 24,
            fontWeight: FontWeight.w800,
            fontFamily: 'Tajawal',
          ),
        ),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          decoration: BoxDecoration(
            color: AppColors.accentSecondary.withOpacity(0.18),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            tag,
            style: TextStyle(
              color: AppColors.accentSecondary,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              fontFamily: 'Tajawal',
            ),
          ),
        ),
      ],
    );
  }
}
