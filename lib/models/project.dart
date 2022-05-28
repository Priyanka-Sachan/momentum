class Project {
  String id;
  String title;
  String description;
  int timeEstimated;
  int timeTaken;
  int progress;
  List<String> tasks;

  Project(
      {required this.id,
      required this.title,
      required this.description,
      required this.timeEstimated,
      required this.timeTaken,
      required this.progress,
      required this.tasks});

  factory Project.fromJson(Map<String, dynamic> json) => _projectFromJson(json);

  Map<String, dynamic> toJson() => _projectToJson(this);
}

Project _projectFromJson(Map<String, dynamic> json) {
  return Project(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      timeEstimated: json['timeEstimated'] as int,
      timeTaken: json['timeTaken'] as int,
      progress: json['progress'] as int,
      tasks: (json['tasks'] as List<dynamic>).cast<String>());
}

Map<String, dynamic> _projectToJson(Project instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'timeEstimated': instance.timeEstimated,
      'timeTaken': instance.timeTaken,
      'progress': instance.progress,
      'tasks': instance.tasks
    };
