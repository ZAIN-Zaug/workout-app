import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_app/cubit/program/program_cubit.dart';
import 'package:sport_app/widget/program_detail_view/build_exercise_list.dart';
import '../cubit/home/exercise_cubit.dart';
import '../model/exercise_model.dart';
import '../model/work_out_program.dart';
import '../theme/color.dart';
import '../widget/general/show_dialog.dart';
import '../widget/program_detail_view/build_top_bar1.dart';
import 'add_exercise_to_program.dart';
import 'delete_exercise_program.dart';

class ProgramDetailsView extends StatelessWidget {
  const ProgramDetailsView({super.key, required this.program});

  final WorkoutProgram program;

  @override
  Widget build(BuildContext context) {
    final allExercises = BlocProvider.of<ExercisesCubit>(context).exercises;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.background,
        drawer: Drawer(
          width: 200,
          backgroundColor: AppColors.surface,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(color: AppColors.background),
                child: Text(
                  'قائمة  التعديلات',
                  style: TextStyle(color: AppColors.textPrimary, fontSize: 24),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.edit, color: AppColors.accent),
                title: const Text(
                  'تعديل اسم البرنامج',
                  style: TextStyle(color: AppColors.textPrimary),
                ),
                onTap: () {
                  showEditFieldDialog(context: context, program: program);
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete, color: AppColors.accent),
                title: const Text(
                  'حذف تمرين',
                  style: TextStyle(color: AppColors.textPrimary),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          DeleteExercisesView(program: program),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.add, color: AppColors.accent),
                title: const Text(
                  'اضافة تمرين',
                  style: TextStyle(color: AppColors.textPrimary),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          AddExercisesToProgram(program: program),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: BlocBuilder<ProgramCubit, ProgramState>(
            builder: (context, state) {
              final List<ExerciseModel> programExercises = allExercises
                  .where(
                    (exercise) => program.exerciseIds.contains(exercise.id),
                  )
                  .toList();
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BuildTopBar1(
                    text: program.name,
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: programExercises.isEmpty
                        ? _buildEmptyState()
                        : BuildExerciseList(exercises: programExercises),
                  ),
                ],
              );
            },
          ),
        ),
      ),
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
