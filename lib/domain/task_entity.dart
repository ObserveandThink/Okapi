import 'tag_entity.dart';
import 'timetracking_entity.dart';
import 'comment_entity.dart';

class Task {
  final int id;
  final String title;
  final String description;
  final List<Tag> tags;
  final bool isCompleted;
  final List<Comment> comments;
  final TimeTracking timeTracking;
  final TimeTracking andonTimeTracking;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.tags,
    required this.isCompleted,
    required this.comments,
    required this.timeTracking,
    required this.andonTimeTracking,
  });
}
