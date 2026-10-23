import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_app/cubit/progress/progress_cubit.dart';

import '../../model/progress_entry.dart';
import '../../theme/color.dart';

class ProgressHistoryList extends StatefulWidget {
  final List<ProgressEntry> entries;

  const ProgressHistoryList({super.key, required this.entries});

  @override
  State<ProgressHistoryList> createState() => _ProgressHistoryListState();
}

class _ProgressHistoryListState extends State<ProgressHistoryList> {
  @override
  Widget build(BuildContext context) {
    if (widget.entries.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Center(
          child: Text(
            'ما في إدخالات مسجلة لسا',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontFamily: 'Tajawal',
            ),
          ),
        ),
      );
    }

    // ترتيب الإدخالات: الأحدث أولاً
    final sortedEntries = [...widget.entries]
      ..sort((a, b) => b.date.compareTo(a.date));

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: BoxBorder.all(color: Colors.white),
      ),
      child: ListView.separated(
        itemCount: sortedEntries.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          final entry = sortedEntries[index];
          return _buildEntryCard(entry, () {
            BlocProvider.of<ProgressCubit>(
              context,
            ).loadEntriesForExercise(entry.exerciseId);
          });
        },
      ),
    );
  }

  Widget _buildEntryCard(ProgressEntry entry, VoidCallback onSaved) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // التاريخ
          Expanded(
            flex: 2,
            child: Text(
              _formatDate(entry.date),
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 13,
                fontFamily: 'Tajawal',
              ),
            ),
          ),
          // الوزن
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Icon(Icons.fitness_center, size: 16, color: AppColors.accent),
                const SizedBox(width: 6),
                Text(
                  '${entry.weight} كغ',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Tajawal',
                  ),
                ),
              ],
            ),
          ),
          // التكرارات
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Icon(Icons.repeat, size: 16, color: AppColors.accentSecondary),
                const SizedBox(width: 6),
                Text(
                  '${entry.reps} تكرار',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Tajawal',
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              entry.delete();
              onSaved();
            },
            icon: Icon(Icons.delete, color: AppColors.accent, size: 25),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }
}
