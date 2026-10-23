import 'package:flutter/material.dart';

import '../../model/exercise_model.dart';
import 'build_muscle_group_section.dart';

class GroupedExerciseList extends StatelessWidget {
  final Map<String, List<ExerciseModel>> groupedExercises;
  final Set<int> selectedExercises;
  final void Function(int id) onToggle;

  const GroupedExerciseList({
    super.key,
    required this.groupedExercises,
    required this.selectedExercises,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 20),
      children: groupedExercises.entries.map((entry) {
        return MuscleGroupSection(
          muscleGroup: entry.key,
          exercises: entry.value,
          selectedExercises: selectedExercises,
          onToggle: onToggle,
        );
      }).toList(),
    );
  }
}
