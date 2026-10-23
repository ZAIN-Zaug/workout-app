
import 'package:hive/hive.dart';


part 'work_out_program.g.dart';


@HiveType(typeId: 0)
class WorkoutProgram extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
   String name;

  @HiveField(2)
  final List<int> exerciseIds;

  WorkoutProgram({
    required this.id,
    required this.name,
    required this.exerciseIds,
  });
}