import 'package:flutter/material.dart';
import 'package:notes_app/utils/date_time_picker_util.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class EditNotesViewBody extends StatefulWidget {
  const EditNotesViewBody({super.key});

  @override
  State<EditNotesViewBody> createState() => _EditNotesViewBodyState();
}

class _EditNotesViewBodyState extends State<EditNotesViewBody> {
  final _formKey = GlobalKey<FormState>();
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
            CustomTextField(hint: 'Title', maxLines: 2),
            SizedBox(height: 20),
            CustomTextField(hint: 'Content', maxLines: 5),
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
                onPressed: () {},
                child: Text(
                  'Edit Note',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
