import 'package:flutter/material.dart';

import '../../theme/color.dart';
import '../../view/create_program_view.dart';

class EmptyProgramsState extends StatelessWidget {
  const EmptyProgramsState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 88,
              height: 88,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.surface,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.list_alt_rounded,
                color: AppColors.accentSecondary,
                size: 40,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'ما في عندك أي برنامج لسا',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 17,
                fontWeight: FontWeight.w700,
                fontFamily: 'Tajawal',
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'أنشئ أول برنامج تدريبي إلك وابدأ تراقب تطورك بكل تمرين',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 14,
                height: 1.6,
                fontFamily: 'Tajawal',
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CreateProgramView(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accent,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: Text(
                'إنشاء برنامج جديد',
                style: TextStyle(
                  color: AppColors.background,
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Tajawal',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
