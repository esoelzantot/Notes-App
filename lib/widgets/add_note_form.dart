import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:notes_app/cubits/add_notes_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/utils/date_time_picker_util.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  final Map<String, TextEditingController> controllers = {
    'title': TextEditingController(text: ''),
    'content': TextEditingController(text: ''),
    'date': TextEditingController(text: ''),
  };

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextField(
              hint: 'Title',
              maxLines: 2,
              onSaved: (value) {
                controllers['title']!.text = value!;
              },
              onChanged: (value) {
                controllers['title']!.text = value;
              },
            ),
            SizedBox(height: 20),
            CustomTextField(
              hint: 'Content',
              maxLines: 5,
              onSaved: (value) {
                controllers['content']!.text = value!;
              },
              onChanged: (value) {
                controllers['content']!.text = value;
              },
            ),
            SizedBox(height: 20),
            DateTimePickerUtil.buildDateTimePickerField(
              context: context,
              controller: controllers['date']!,
              labelText: 'Deadline',
              validator: (val) => val?.isEmpty ?? true ? 'Enter a date' : null,
            ),
            SizedBox(height: 50),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  backgroundColor: Colors.deepPurpleAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    NoteModel note = NoteModel(
                      title: controllers['title']!.text,
                      content: controllers['content']!.text,
                      date: controllers['date']!.text,
                      isCompleted: false,
                    );
                    BlocProvider.of<AddNoteCubit>(context).addNote(note);
                    Logger().d("Note added successfully | $note");
                  } else {
                    autoValidateMode = AutovalidateMode.always;
                  }
                },
                child: Text(
                  'Add Note',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
