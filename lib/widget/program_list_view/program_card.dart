import '../../theme/color.dart';
import 'package:flutter/material.dart';

class ProgramCard extends StatelessWidget {
  final String name;
  final int exerciseCount;
  final VoidCallback? onTap;
  final void Function()? onPressed;

  const ProgramCard({
    super.key,
    required this.name,
    required this.exerciseCount,
    this.onTap,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              Container(
                width: 52,
                height: 52,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.accent.withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.fitness_center,
                  color: AppColors.accent,
                  size: 24,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Tajawal',
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(
                          Icons.format_list_bulleted_rounded,
                          color: AppColors.textSecondary,
                          size: 14,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '$exerciseCount تمرين',
                          style: TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 13,
                            fontFamily: 'Tajawal',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_back_ios_rounded,
                color: AppColors.textSecondary,
                size: 16,
              ),
              IconButton(
                onPressed: onPressed,
                icon: Icon(Icons.delete, color: AppColors.accent),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
