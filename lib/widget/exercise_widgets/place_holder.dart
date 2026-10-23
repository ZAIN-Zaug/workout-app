import 'package:flutter/material.dart';

import '../../theme/color.dart';

class PlaceHolder extends StatelessWidget {
  const PlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 12, 20, 0),
      height: 200,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Icon(
          Icons.videocam_off_rounded,
          color: AppColors.textSecondary,
          size: 48,
        ),
      ),
    );
  }
}
