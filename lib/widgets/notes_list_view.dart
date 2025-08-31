import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_notes_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    List<Color> colors = kColors;

    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: CustomNotesItem(
            note: NoteModel(
              title: "Note Title",
              content: "Note Content",
              date: "22 Mar 2022",
              isCompleted: true,
            ),
            color: colors[index % colors.length],
          ),
        );
      },
    );
  }
}
