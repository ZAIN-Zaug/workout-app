import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_app/cubit/home/exercise_cubit.dart';
import 'package:sport_app/cubit/program/program_cubit.dart';

import '../model/exercise_model.dart';
import '../theme/color.dart';
import '../widget/create_program_view/build_group_exercise_list.dart';
import '../widget/create_program_view/build_program_name_field.dart';
import '../widget/create_program_view/build_save_button.dart';
import '../widget/create_program_view/build_top_bar.dart';

class CreateProgramView extends StatefulWidget {
  const CreateProgramView({super.key});

  @override
  State<CreateProgramView> createState() => _CreateProgramViewState();
}

class _CreateProgramViewState extends State<CreateProgramView> {
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final Set<int> _selectedExercises = {};
  String? programName;
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
      grouped.putIfAbsent(exercise.muscleGroup, () => []).add(exercise);
    }

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Form(
        autovalidateMode: autoValidateMode,
        key: formKey,
        child: Scaffold(
          backgroundColor: AppColors.background,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BuildTopBar(title: 'برنامج جديد'),
                ProgramNameField(
                  onSaved: (value) {
                    programName = value;
                  },
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: GroupedExerciseList(
                    groupedExercises: grouped,
                    selectedExercises: _selectedExercises,
                    onToggle: _toggleExercise,
                  ),
                ),
                SaveProgramButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      if (_selectedExercises.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'لازم تختار تمرين واحد على الأقل',
                              style: TextStyle(fontFamily: 'Tajawal'),
                            ),
                            backgroundColor: AppColors.surface,
                          ),
                        );
                        return;
                      }

                      formKey.currentState!.save();
                      BlocProvider.of<ProgramCubit>(context).addProgram(
                        name: programName!,
                        exerciseIds: _selectedExercises.toList(),
                      );
                      Navigator.pop(context);
                    } else {
                      autoValidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                  title: 'حفظ البرنامج',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
