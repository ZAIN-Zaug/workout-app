import 'package:flutter/material.dart';

import '../../theme/color.dart';

class BuildHeader extends StatelessWidget {
  const BuildHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 12),
      child: Text(
        'مكتبة التمارين',
        style: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 28,
          fontWeight: FontWeight.w800,
          fontFamily: 'Tajawal',
        ),
      ),
    );
  }
}
