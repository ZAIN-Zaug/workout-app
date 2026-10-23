import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import '../../model/work_out_program.dart';

part 'program_state.dart';

class ProgramCubit extends Cubit<ProgramState> {
  ProgramCubit() : super(ProgramInitial());

  final Box<WorkoutProgram> _programsBox = Hive.box<WorkoutProgram>(
    'programsBox',
  );

  void loadPrograms() {
    final programs = _programsBox.values.toList();
    emit(ProgramsLoaded(programs));
  }

  Future<void> addProgram({
    required String name,
    required List<int> exerciseIds,
  }) async {
    final newProgram = WorkoutProgram(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      exerciseIds: exerciseIds,
    );

    await _programsBox.add(newProgram);
    loadPrograms();
  }

  Future<void> editNameProgram({
    required String newName,
    required WorkoutProgram program,
  }) async {
    program.name = newName;
    await program.save();
    loadPrograms();
  }

  Future<void> addExercisesToProgram({
    required WorkoutProgram program,
    required List<int> selectedExercises,
  }) async {
    program.exerciseIds.addAll(selectedExercises);
    await program.save();
    loadPrograms();
  }

  Future<void> deleteExerciseFromProgram({
    required WorkoutProgram program,
    required List<int> selectedIds,
  }) async {
    program.exerciseIds.removeWhere((id) => selectedIds.contains(id));
    await program.save();
    loadPrograms();
  }
}
