part of 'program_cubit.dart';

@immutable
sealed class ProgramState {}

final class ProgramInitial extends ProgramState {}

class ProgramsLoaded extends ProgramState {
  final List<WorkoutProgram> programs;
  ProgramsLoaded(this.programs);
}
