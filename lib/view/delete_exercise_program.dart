import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/home/exercise_cubit.dart';
import '../cubit/program/program_cubit.dart';
import '../model/exercise_model.dart';
import '../model/work_out_program.dart';
import '../theme/color.dart';
import '../widget/home_widget/exercise_card.dart';

class DeleteExercisesView extends StatefulWidget {
  final WorkoutProgram program;

  const DeleteExercisesView({super.key, required this.program});

  @override
  State<DeleteExercisesView> createState() => _DeleteExercisesViewState();
}

class _DeleteExercisesViewState extends State<DeleteExercisesView> {
  final Set<int> _selectedIds = {};

  void _toggleSelection(int exerciseId) {
    setState(() {
      if (_selectedIds.contains(exerciseId)) {
        _selectedIds.remove(exerciseId);
      } else {
        _selectedIds.add(exerciseId);
      }
    });
  }

  void _deleteSelected() {
    BlocProvider.of<ProgramCubit>(context).deleteExerciseFromProgram(
      program: widget.program,
      selectedIds: _selectedIds.toList(),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final bool hasSelection = _selectedIds.isNotEmpty;
    final allExercises = BlocProvider.of<ExercisesCubit>(context).exercises;
    final List<ExerciseModel> programExercises = allExercises
        .where((exercise) => widget.program.exerciseIds.contains(exercise.id))
        .toList();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTopBar(hasSelection),
              const SizedBox(height: 8),
              Expanded(
                child: programExercises.isEmpty
                    ? _buildEmptyState()
                    : _buildExercisesList(programExercises),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar(bool hasSelection) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
      child: Row(
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_forward, color: AppColors.textPrimary),
          ),
          const SizedBox(width: 4),
          Expanded(
            child: Text(
              'اختر التمارين يلي بدك تحذفها',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 18,
                fontWeight: FontWeight.w800,
                fontFamily: 'Tajawal',
              ),
            ),
          ),
          TextButton(
            onPressed: hasSelection ? _deleteSelected : null,
            child: Text(
              'حذف',
              style: TextStyle(
                color: hasSelection ? Colors.white : AppColors.textSecondary,
                fontSize: 16,
                fontWeight: FontWeight.w800,
                fontFamily: 'Tajawal',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExercisesList(List<ExerciseModel> programExercises) {
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
      itemCount: programExercises.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final exercise = programExercises[index];
        final bool isSelected = _selectedIds.contains(exercise.id);

        return GestureDetector(
          onTap: () => _toggleSelection(exercise.id),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: isSelected ? Colors.white : Colors.transparent,
                width: 2,
              ),
            ),
            child: Stack(
              children: [
                Opacity(
                  opacity: isSelected ? 0.5 : 1,
                  child: ExerciseCard(exercise: exercise),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Text(
        'ما في تمارين بهاد البرنامج',
        style: TextStyle(color: AppColors.textSecondary, fontFamily: 'Tajawal'),
      ),
    );
  }
}
