class ExerciseModel {
  final int id;
  final String name;
  final String description;
  final String muscleGroup;
  final List<String> steps;
  final String thumbnailPath;
  final String videoPath;

  ExerciseModel({
    required this.id,
    required this.name,
    required this.description,
    required this.muscleGroup,
    required this.steps,
    required this.thumbnailPath,
    required this.videoPath,
  });

  factory ExerciseModel.fromJson(Map<String, dynamic> json) {
    return ExerciseModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      muscleGroup: json['muscleGroup'],
      steps: List<String>.from(json['steps']),
      thumbnailPath: json['thumbnailPath'],
      videoPath: json['videoPath'],
    );
  }
}