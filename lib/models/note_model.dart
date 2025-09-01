import 'package:hive_flutter/adapters.dart';

part 'note_model.g.dart';

@HiveType(typeId: 1)
class NoteModel extends HiveObject {
  @HiveField(1)
  String title;
  @HiveField(2)
  String content;
  @HiveField(3)
  String date;
  @HiveField(4)
  String status;

  NoteModel({
    required this.title,
    required this.content,
    required this.date,
    required this.status,
  });

  // Convert NoteModel to Map for JSON serialization
  Map<String, dynamic> toMap() {
    return {'title': title, 'content': content, 'date': date, 'status': status};
  }

  // Create NoteModel from Map for JSON deserialization
  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      title: map['title'] ?? '',
      content: map['content'] ?? '',
      date: map['date'] ?? '',
      status: map['status'] ?? '',
    );
  }

  // Copy method for creating modified instances
  NoteModel copyWith({
    String? title,
    String? content,
    String? date,
    String? status,
  }) {
    return NoteModel(
      title: title ?? this.title,
      content: content ?? this.content,
      date: date ?? this.date,
      status: status ?? this.status,
    );
  }

  @override
  String toString() {
    return 'NoteModel(title: $title, content: $content, date: $date, status: $status)';
  }
}
