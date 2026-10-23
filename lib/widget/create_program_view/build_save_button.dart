import 'package:flutter/material.dart';

import '../../theme/color.dart';

class SaveProgramButton extends StatelessWidget {
  const SaveProgramButton({super.key, this.onPressed, required this.title});
  final void Function()? onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.accent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          child: Text(
            title,
            style: TextStyle(
              color: AppColors.background,
              fontSize: 16,
              fontWeight: FontWeight.w800,
              fontFamily: 'Tajawal',
            ),
          ),
        ),
      ),
    );
  }
}
