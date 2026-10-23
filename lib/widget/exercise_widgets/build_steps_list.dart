import 'package:flutter/material.dart';

import '../../theme/color.dart';

class StepsList extends StatelessWidget {
  const StepsList({super.key, required this.steps});

  final List<String> steps;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(steps.length, (index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 26,
                height: 26,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.accent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '${index + 1}',
                  style: TextStyle(
                    color: AppColors.background,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'Tajawal',
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  steps[index],
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 14,
                    height: 1.5,
                    fontFamily: 'Tajawal',
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
