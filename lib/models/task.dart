class Task {
  String id;
  String projectId;
  String title;
  DateTime scheduledDateTime;
  int intervalEstimated;
  int intervalTaken;
  int progress;
  List<String> tags;
  List<String> sprints;

  Task.name(
      this.id,
      this.projectId,
      this.title,
      this.scheduledDateTime,
      this.intervalEstimated,
      this.intervalTaken,
      this.progress,
      this.tags,
      this.sprints);
}
