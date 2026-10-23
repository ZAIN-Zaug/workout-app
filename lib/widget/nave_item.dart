import 'package:flutter/material.dart';

import '../theme/color.dart';


class NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const NavItem({super.key, required this.icon, required this.label, required this.isSelected, required this.onTap});



  @override
  Widget build(BuildContext context) {
    final color = isSelected ? AppColors.accent : AppColors.textSecondary;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 26),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                fontFamily: 'Tajawal',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
