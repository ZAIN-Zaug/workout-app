import 'package:flutter/material.dart';

import '../../theme/color.dart';

class BuildTopBar extends StatelessWidget {
  const BuildTopBar({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 20,
              fontWeight: FontWeight.w800,
              fontFamily: 'Tajawal',
            ),
          ),
          Spacer(),
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_forward, color: AppColors.textPrimary),
          ),
          const SizedBox(width: 4),
        ],
      ),
    );
  }
}
