import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sport_app/model/exercise_model.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.exercises) : super(SearchInitial());

  final List<ExerciseModel> exercises;

  void searchExercises(String query) {
    final normalizedQuery = query.trim().toLowerCase();

    if (normalizedQuery.isEmpty) {
      emit(SearchInitial());
      return;
    }

    final result = exercises
        .where(
          (exercise) => exercise.name.toLowerCase().contains(normalizedQuery),
        )
        .toList();

    emit(SearchSuccess(exercises: result));
  }
}
