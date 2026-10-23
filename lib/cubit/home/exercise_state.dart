import '../../model/exercise_model.dart';

sealed  class ExercisesState {}

final class ExercisesInitial extends ExercisesState {}

final class ExercisesLoading extends ExercisesState {}

final class ExercisesSuccess extends ExercisesState {
  final List<ExerciseModel> exercisesHome;

  ExercisesSuccess({required this.exercisesHome});
}

final class ExercisesFailure extends ExercisesState {
  final String message;
  ExercisesFailure(this.message);
}
