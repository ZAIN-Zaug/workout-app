import 'package:flutter/material.dart';
import 'package:sport_app/view/search_result_view.dart';

import '../../theme/color.dart';

class BuildSearchBar extends StatelessWidget {
  const BuildSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SearchResultsView()),
        );
      },
      borderRadius: BorderRadius.circular(14),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(14),
          ),
          child: const Row(
            children: [
              Icon(Icons.search, color: AppColors.textSecondary),
              SizedBox(width: 10),
              Text(
                'ابحث عن اسم تمرين...',
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontFamily: 'Tajawal',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
