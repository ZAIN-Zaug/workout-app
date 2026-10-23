part of 'progress_cubit.dart';

@immutable
sealed class ProgressState {}

final class ProgressInitial extends ProgressState {}

class ProgressLoaded extends ProgressState {
  final List<ProgressEntry> entries;
  ProgressLoaded(this.entries);
}
