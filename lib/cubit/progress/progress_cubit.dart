import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import '../../model/progress_entry.dart';

part 'progress_state.dart';

class ProgressCubit extends Cubit<ProgressState> {
  ProgressCubit() : super(ProgressInitial());

  final Box<ProgressEntry> _progressBox = Hive.box<ProgressEntry>(
    'progressBox',
  );

  void loadEntriesForExercise(int exerciseId) {
    final entries = _progressBox.values
        .where((entry) => entry.exerciseId == exerciseId)
        .toList();

    entries.sort((a, b) => b.date.compareTo(a.date));

    emit(ProgressLoaded(entries));
  }

  Future<void> addEntry({
    required int exerciseId,
    required double weight,
    required int reps,
  }) async {
    final newEntry = ProgressEntry(
      exerciseId: exerciseId,
      date: DateTime.now(),
      weight: weight,
      reps: reps,
    );

    await _progressBox.add(newEntry);
    loadEntriesForExercise(exerciseId);
  }
}
