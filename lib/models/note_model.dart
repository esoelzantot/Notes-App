import 'package:hive_flutter/adapters.dart';

part 'note_model.g.dart';

@HiveType(typeId: 1)
class NoteModel extends HiveObject {
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String content;
  @HiveField(3)
  final String date;
  @HiveField(4)
  final bool isCompleted;

  NoteModel({
    required this.title,
    required this.content,
    required this.date,
    required this.isCompleted,
  });

  // Convert NoteModel to Map for JSON serialization
  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
      'date': date,
      'status': isCompleted,
    };
  }

  // Create NoteModel from Map for JSON deserialization
  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      title: map['title'] ?? '',
      content: map['content'] ?? '',
      date: map['date'] ?? '',
      isCompleted: map['isCompleted'] ?? '',
    );
  }

  // Copy method for creating modified instances
  NoteModel copyWith({
    String? title,
    String? content,
    String? date,
    bool? isCompleted,
  }) {
    return NoteModel(
      title: title ?? this.title,
      content: content ?? this.content,
      date: date ?? this.date,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  String toString() {
    return 'NoteModel(title: $title, content: $content, date: $date, isCompleted: $isCompleted)';
  }
}
