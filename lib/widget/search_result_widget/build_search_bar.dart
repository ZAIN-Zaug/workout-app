import 'package:flutter/material.dart';

import '../../theme/color.dart';

class SearchResultsBar extends StatelessWidget {
  const SearchResultsBar({super.key, this.onChanged});
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Container(
        height: 45,

        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search, color: AppColors.textSecondary),
            ),
            Expanded(
              child: TextField(
                onChanged: onChanged,
                autofocus: true,
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontFamily: 'Tajawal',
                ),
                cursorColor: AppColors.accentSecondary,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'ابحث عن اسم التمرين ...',
                  hintStyle: TextStyle(
                    color: AppColors.textSecondary,
                    fontFamily: 'Tajawal',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
