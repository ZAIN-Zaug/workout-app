import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/exercise_model.dart';
import 'exercise_state.dart';

class ExercisesCubit extends Cubit<ExercisesState> {
  ExercisesCubit() : super(ExercisesInitial());

  List<ExerciseModel> exercises = [];

  Future<void> fetchExercises() async {
    emit(ExercisesLoading());

    try {
      final String jsonString = await rootBundle.loadString(
        'assets/data/exercise.json',
      );
      final List<dynamic> jsonList = jsonDecode(jsonString);
      exercises = jsonList.map((item) => ExerciseModel.fromJson(item)).toList();
      emit(ExercisesSuccess(exercisesHome: exercises));
    } catch (e) {
      emit(ExercisesFailure(e.toString()));
    }
  }

  Future<void> fetchExercisesByMuscleGroup({
    required String muscleGroup,
  }) async {
    emit(ExercisesLoading());

    final filtered = exercises
        .where((exercise) => exercise.muscleGroup == muscleGroup)
        .toList();
    emit(ExercisesSuccess(exercisesHome: filtered));
  }

  void showAllExercises() {
    emit(ExercisesSuccess(exercisesHome: exercises));
  }
}
