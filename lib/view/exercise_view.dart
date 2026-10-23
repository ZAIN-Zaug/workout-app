import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_app/cubit/progress/progress_cubit.dart';
import 'package:sport_app/model/exercise_model.dart';
import 'package:sport_app/widget/exercise_widgets/ProgressChart.dart';
import 'package:sport_app/widget/exercise_widgets/place_holder.dart';
import 'package:sport_app/widget/exercise_widgets/progress_history_list.dart';

import '../theme/color.dart';
import '../widget/exercise_widgets/AddProgressEntryForm.dart';
import '../widget/exercise_widgets/build_exercise_dscription.dart';
import '../widget/exercise_widgets/build_section_title.dart';
import '../widget/exercise_widgets/build_steps_list.dart';
import '../widget/exercise_widgets/build_title_and_tag.dart';
import '../widget/exercise_widgets/exercise_top_bar.dart';
import '../widget/exercise_widgets/video_place_holder.dart';

class ExerciseView extends StatelessWidget {
  const ExerciseView({super.key, required this.exercise});

  final ExerciseModel exercise;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProgressCubit()..loadEntriesForExercise(exercise.id),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: AppColors.background,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ExerciseTopBar(),
                  PlaceHolder(),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleAndTag(
                          title: exercise.name,
                          tag: exercise.muscleGroup,
                        ),
                        const SizedBox(height: 20),
                        const SectionTitle(title: 'الوصف'),
                        const SizedBox(height: 8),
                        ExerciseDescription(description: exercise.description),
                        const SizedBox(height: 24),
                        SectionTitle(title: 'خطوات الأداء'),
                        const SizedBox(height: 12),
                        StepsList(steps: exercise.steps),
                        const SizedBox(height: 24),
                        const SectionTitle(title: 'سجل تطوري'),
                        const SizedBox(height: 12),
                        AddProgressEntryForm(exerciseId: exercise.id),
                        const SizedBox(height: 30),
                        BlocBuilder<ProgressCubit, ProgressState>(
                          builder: (context, state) {
                            if (state is! ProgressLoaded) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            final entries = state.entries;
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ProgressChart(entries: entries),
                                const SizedBox(height: 20),
                                SizedBox(
                                  height: 300,

                                  child: ProgressHistoryList(entries: entries),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
