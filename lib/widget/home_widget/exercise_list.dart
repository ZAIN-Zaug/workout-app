import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_app/cubit/home/exercise_cubit.dart';
import 'package:sport_app/cubit/home/exercise_state.dart';

import '../../view/exercise_view.dart';
import 'exercise_card.dart';

class ExerciseList extends StatelessWidget {
  const ExerciseList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExercisesCubit, ExercisesState>(
      builder: (context, state) {
        if (state is ExercisesLoading || state is ExercisesInitial) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is ExercisesFailure) {
          return Center(
            child: Text(
              'صار خطأ: ${state.message}',
              style: TextStyle(color: Colors.white),
            ),
          );
        }

        final exercises = (state as ExercisesSuccess).exercisesHome;

        return ListView.separated(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          itemCount: exercises.length,
          separatorBuilder: (_, _) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ExerciseView(exercise: exercises[index]),
                  ),
                );
              },
              child: ExerciseCard(exercise: exercises[index]),
            );
          },
        );
      },
    );
  }
}
