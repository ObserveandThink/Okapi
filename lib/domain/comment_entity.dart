class Comment {
  final int id;
  final String content;
  final DateTime timestamp;
  final bool isAndon;
  final TimeTracking andonTimeTracking;

  Comment({
    required this.id,
    required this.content,
    required this.timestamp,
    required this.isAndon,
    required this.andonTimeTracking,
  });

}
