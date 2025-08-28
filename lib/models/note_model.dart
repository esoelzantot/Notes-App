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
  final String color;

  NoteModel({
    required this.title,
    required this.content,
    required this.date,
    required this.color,
  });

  // Convert NoteModel to Map for JSON serialization
  Map<String, dynamic> toMap() {
    return {'title': title, 'content': content, 'date': date, 'color': color};
  }

  // Create NoteModel from Map for JSON deserialization
  factory NoteModel.fromMap(Map<String, dynamic> map) {
    return NoteModel(
      title: map['title'] ?? '',
      content: map['content'] ?? '',
      date: map['date'] ?? '',
      color: map['color'] ?? '',
    );
  }

  // Copy method for creating modified instances
  NoteModel copyWith({
    String? title,
    String? content,
    String? date,
    String? color,
  }) {
    return NoteModel(
      title: title ?? this.title,
      content: content ?? this.content,
      date: date ?? this.date,
      color: color ?? this.color,
    );
  }

  @override
  String toString() {
    return 'NoteModel(title: $title, content: $content, date: $date, color: $color)';
  }
}
