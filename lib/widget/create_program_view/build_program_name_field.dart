import 'package:flutter/material.dart';

import '../../theme/color.dart';

class ProgramNameField extends StatelessWidget {
  const ProgramNameField({
    super.key,
    this.onChanged,
    this.validator,
    this.onSaved,
  });
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(14),
        ),
        child: TextFormField(
          validator: (value) {
            if (value?.trim().isEmpty ?? true) {
              return "this field is required";
            } else {
              return null;
            }
          },
          onSaved: onSaved,
          style: TextStyle(color: AppColors.textPrimary, fontFamily: 'Tajawal'),
          cursorColor: AppColors.accent,
          decoration: InputDecoration(
            hintText: 'اسم البرنامج :',
            hintStyle: TextStyle(
              color: AppColors.textSecondary,
              fontFamily: 'Tajawal',
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
