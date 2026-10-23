import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/progress/progress_cubit.dart';
import '../../theme/color.dart';

class AddProgressEntryForm extends StatefulWidget {
  final int exerciseId;

  const AddProgressEntryForm({super.key, required this.exerciseId});

  @override
  State<AddProgressEntryForm> createState() => _AddProgressEntryFormState();
}

class _AddProgressEntryFormState extends State<AddProgressEntryForm> {
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _repsController = TextEditingController();

  @override
  void dispose() {
    _weightController.dispose();
    _repsController.dispose();
    super.dispose();
  }

  void _handleAdd() {
    final weight = double.tryParse(_weightController.text);
    final reps = int.tryParse(_repsController.text);

    if (weight == null || reps == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'لازم تدخل رقم صحيح بالوزن والعدات',
            style: TextStyle(fontFamily: 'Tajawal'),
          ),
          backgroundColor: AppColors.surface,
        ),
      );
      return;
    }

    context.read<ProgressCubit>().addEntry(
      exerciseId: widget.exerciseId,
      weight: weight,
      reps: reps,
    );

    _weightController.clear();
    _repsController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildInputField(
            controller: _weightController,
            hint: 'الوزن (كغ)',
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: _buildInputField(controller: _repsController, hint: 'العدات'),
        ),
        const SizedBox(width: 10),
        _buildAddButton(),
      ],
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String hint,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: controller,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        style: TextStyle(color: AppColors.textPrimary, fontFamily: 'Tajawal'),
        cursorColor: AppColors.accent,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 13,
            fontFamily: 'Tajawal',
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 12),
        ),
      ),
    );
  }

  Widget _buildAddButton() {
    return Material(
      color: AppColors.accent,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: _handleAdd,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Icon(Icons.add, color: AppColors.background),
        ),
      ),
    );
  }
}
