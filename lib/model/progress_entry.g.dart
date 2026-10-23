

part of 'progress_entry.dart';


class ProgressEntryAdapter extends TypeAdapter<ProgressEntry> {
  @override
  final int typeId = 1;

  @override
  ProgressEntry read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProgressEntry(
      exerciseId: fields[0] as int,
      date: fields[1] as DateTime,
      weight: fields[2] as double,
      reps: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ProgressEntry obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.exerciseId)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.weight)
      ..writeByte(3)
      ..write(obj.reps);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProgressEntryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
