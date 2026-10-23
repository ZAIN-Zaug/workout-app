import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_app/cubit/home/exercise_cubit.dart';
import 'package:sport_app/cubit/program/program_cubit.dart';
import 'package:sport_app/model/work_out_program.dart';
import '../model/exercise_model.dart';
import '../theme/color.dart';
import '../widget/create_program_view/build_group_exercise_list.dart';
import '../widget/create_program_view/build_save_button.dart';
import '../widget/create_program_view/build_top_bar.dart';

class AddExercisesToProgram extends StatefulWidget {
  const AddExercisesToProgram({super.key, required this.program});
  final WorkoutProgram program;

  @override
  State<AddExercisesToProgram> createState() => _AddExercisesToProgramState();
}

class _AddExercisesToProgramState extends State<AddExercisesToProgram> {
  final Set<int> _selectedExercises = {};

  void _toggleExercise(int id) {
    setState(() {
      if (_selectedExercises.contains(id)) {
        _selectedExercises.remove(id);
      } else {
        _selectedExercises.add(id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, List<ExerciseModel>> grouped = {};
    final exercises = BlocProvider.of<ExercisesCubit>(context).exercises;
    for (final exercise in exercises) {
      if (!widget.program.exerciseIds.contains(exercise.id)) {
        grouped.putIfAbsent(exercise.muscleGroup, () => []).add(exercise);
      }
    }

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BuildTopBar(title: 'اضافة تمارين'),
              const SizedBox(height: 8),
              Expanded(
                child: GroupedExerciseList(
                  groupedExercises: grouped,
                  selectedExercises: _selectedExercises,
                  onToggle: _toggleExercise,
                ),
              ),
              SaveProgramButton(
                onPressed: _selectedExercises.isEmpty
                    ? null
                    : () {
                        BlocProvider.of<ProgramCubit>(
                          context,
                        ).addExercisesToProgram(
                          program: widget.program,
                          selectedExercises: _selectedExercises.toList(),
                        );

                        Navigator.pop(context);
                      },
                title: 'اضافة تمارين',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
