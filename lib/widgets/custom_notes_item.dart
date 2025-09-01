import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/get_notes_cubit/get_notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/utils/custom_confirm_dialog.dart';
import 'package:notes_app/views/edit_notes_view.dart';

class CustomNotesItem extends StatelessWidget {
  const CustomNotesItem({super.key, required this.note});
  final NoteModel note;

  void deleteNote({required BuildContext context}) async {
    await showCustomConfirmationDialog(
      context: context,
      title: 'Delete Note',
      message: 'Are you sure you want to delete this note?',
      onConfirmed: () {
        note.delete();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10.0),
      decoration: BoxDecoration(
        color: getColor(status: note.status),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          ListTile(
            title: Text(
              note.title,
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                note.content,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black.withAlpha(250),
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ),
          Divider(
            color: Colors.white,
            thickness: 0.5,
            endIndent: 20,
            indent: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    style: IconButton.styleFrom(
                      minimumSize: const Size(30, 30),
                      maximumSize: const Size(30, 30),
                      iconSize: 20,
                      backgroundColor: Colors.white.withAlpha(200),
                    ),
                    onPressed: () => deleteNote(context: context),
                    icon: Center(
                      child: Icon(Icons.delete, color: Colors.redAccent),
                    ),
                  ),
                  IconButton(
                    padding: EdgeInsets.zero,
                    style: IconButton.styleFrom(
                      minimumSize: const Size(30, 30),
                      maximumSize: const Size(30, 30),
                      iconSize: 20,
                      backgroundColor: Colors.white.withAlpha(200),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return EditNotesView(note: note);
                          },
                        ),
                      );
                    },
                    icon: Center(child: Icon(Icons.edit, color: Colors.black)),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  note.date,
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Color getColor({required String status}) {
    switch (status) {
      case kPending:
        return Color(0xFF64B5F6);
      case kProgress:
        return Color(0xFFFFCC80);
      case kDone:
        return Color(0xFF81C784);
      default:
        return Color(0xFF64B5F6);
    }
  }
}
