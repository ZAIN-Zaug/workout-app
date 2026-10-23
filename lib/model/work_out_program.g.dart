
part of 'work_out_program.dart';


class WorkoutProgramAdapter extends TypeAdapter<WorkoutProgram> {
  @override
  final int typeId = 0;

  @override
  WorkoutProgram read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WorkoutProgram(
      id: fields[0] as String,
      name: fields[1] as String,
      exerciseIds: (fields[2] as List).cast<int>(),
    );
  }

  @override
  void write(BinaryWriter writer, WorkoutProgram obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.exerciseIds);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkoutProgramAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
