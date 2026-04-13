enum QuizAttemptType {
  today,
  daily,
  topic,
}

class QuizAttemptArgs{
  const QuizAttemptArgs({
    required this.type,
    required this.topicId, 
    this.assignedDate, 
    this.title, 
    this.attemptId,
  });

  final QuizAttemptType type;
  final int topicId;
  final DateTime? assignedDate;
  final String? title;
  final String? attemptId;
}