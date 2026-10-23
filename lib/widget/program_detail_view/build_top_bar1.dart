import 'package:flutter/material.dart';
import '../../theme/color.dart';

class BuildTopBar1 extends StatelessWidget {
  const BuildTopBar1({super.key, required this.onPressed, required this.text});
  final void Function() onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
      child: Row(
        children: [
          IconButton(
            onPressed: onPressed,
            icon: Icon(Icons.dehaze, color: AppColors.textPrimary),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Text(
              text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 20,
                fontWeight: FontWeight.w800,
                fontFamily: 'Tajawal',
              ),
            ),
          ),

          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_forward, color: AppColors.textPrimary),
          ),
        ],
      ),
    );
    ;
  }
}
