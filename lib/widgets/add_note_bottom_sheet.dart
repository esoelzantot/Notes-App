import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/utils/date_time_picker_util.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class AddNoteBottomSheet extends StatefulWidget {
  const AddNoteBottomSheet({super.key});

  @override
  State<AddNoteBottomSheet> createState() => _AddNoteBottomSheetState();
}

class _AddNoteBottomSheetState extends State<AddNoteBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final Map<String, TextEditingController> controllers = {
    'title': TextEditingController(text: ''),
    'content': TextEditingController(text: ''),
    'startDate': TextEditingController(text: ''),
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Form(
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
                controller: controllers['startDate']!,
                labelText: 'Deadline',
                validator: (val) =>
                    val?.isEmpty ?? true ? 'Enter a date' : null,
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
                    'Add Note',
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
      ),
    );
  }
}
