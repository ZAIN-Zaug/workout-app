import 'package:flutter/material.dart';
import 'package:sport_app/model/exercise_model.dart';

import '../../view/exercise_view.dart';
import '../home_widget/exercise_card.dart';

class BuildExerciseList extends StatelessWidget {
  const BuildExerciseList({super.key, required this.exercises});
  final List<ExerciseModel> exercises;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
      itemCount: exercises.length,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final exercise = exercises[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ExerciseView(exercise: exercise),
              ),
            );
          },
          child: ExerciseCard(exercise: exercise),
        );
      },
    );
  }
}
