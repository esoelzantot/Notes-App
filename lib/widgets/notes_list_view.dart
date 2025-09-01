import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/get_notes_cubit/get_notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_notes_item.dart';
import 'package:notes_app/widgets/not_notes_found.dart';

class NotesListView extends StatefulWidget {
  const NotesListView({super.key});

  @override
  State<NotesListView> createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetNotesCubit>(context).getNotes();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetNotesCubit, GetNotesState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<GetNotesCubit>(context).notes;
        return (state is GetNotesSuccess && notes.isNotEmpty)
            ? ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: CustomNotesItem(note: notes[index]),
                  );
                },
              )
            : NotNotesFound();
      },
      buildWhen: (previous, current) =>
          current is GetNotesSuccess ||
          current is GetNotesFailure ||
          current is GetNotesLoading,
    );
  }
}
