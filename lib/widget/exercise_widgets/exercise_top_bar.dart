import 'package:flutter/material.dart';

import '../../theme/color.dart';

class ExerciseTopBar extends StatelessWidget {
  const ExerciseTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_forward, color: AppColors.textPrimary),
          ),
        ],
      ),
    );
  }
}
