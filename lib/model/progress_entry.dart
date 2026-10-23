import 'package:hive/hive.dart';

part 'progress_entry.g.dart';

@HiveType(typeId: 1)
class ProgressEntry extends HiveObject {
  @HiveField(0)
  final int exerciseId;

  @HiveField(1)
  final DateTime date;

  @HiveField(2)
  final double weight;

  @HiveField(3)
  final int reps;

  ProgressEntry({
    required this.exerciseId,
    required this.date,
    required this.weight,
    required this.reps,
  });
}