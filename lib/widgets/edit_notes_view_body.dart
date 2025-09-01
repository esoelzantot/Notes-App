import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/utils/date_time_picker_util.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class EditNotesViewBody extends StatefulWidget {
  const EditNotesViewBody({super.key, required this.note});
  final NoteModel note;

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
  String status = '';

  // قائمة الـ Status المتاحة
  final List<String> statusOptions = ['pending', 'progress', 'done'];

  // ألوان وأيقونات لكل status
  final Map<String, Color> statusColors = {
    'pending': Colors.orange,
    'progress': Colors.blue,
    'done': Colors.green,
  };

  final Map<String, IconData> statusIcons = {
    'pending': Icons.schedule,
    'progress': Icons.autorenew,
    'done': Icons.check_circle,
  };

  @override
  void initState() {
    super.initState();
    controllers['title']!.text = widget.note.title;
    controllers['content']!.text = widget.note.content;
    controllers['date']!.text = widget.note.date;
    status = widget.note.status;
  }

  // Widget لعرض Status Selector
  Widget _buildStatusSelector() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Status',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade700,
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: statusOptions.map((statusOption) {
              bool isSelected = status == statusOption;
              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      status = statusOption;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? statusColors[statusOption]!.withOpacity(0.1)
                          : Colors.transparent,
                      border: Border.all(
                        color: isSelected
                            ? statusColors[statusOption]!
                            : Colors.grey.shade300,
                        width: isSelected ? 2 : 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        Icon(
                          statusIcons[statusOption],
                          color: isSelected
                              ? statusColors[statusOption]
                              : Colors.grey.shade600,
                          size: 24,
                        ),
                        SizedBox(height: 4),
                        Text(
                          statusOption.toUpperCase(),
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: isSelected
                                ? FontWeight.w600
                                : FontWeight.w400,
                            color: isSelected
                                ? statusColors[statusOption]
                                : Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

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
              controller: controllers['title']!,
            ),
            SizedBox(height: 20),
            CustomTextField(
              hint: 'Content',
              maxLines: 5,
              controller: controllers['content']!,
            ),
            SizedBox(height: 20),
            DateTimePickerUtil.buildDateTimePickerField(
              context: context,
              controller: controllers['date']!,
              labelText: 'Deadline',
              validator: (val) => val?.isEmpty ?? true ? 'Enter a date' : null,
            ),
            SizedBox(height: 20),
            // إضافة Status Selector هنا
            _buildStatusSelector(),
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
                    editNote(context);
                  }
                },
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

  void editNote(BuildContext context) {
    widget.note.title = controllers['title']!.text;
    widget.note.content = controllers['content']!.text;
    widget.note.date = controllers['date']!.text;
    widget.note.status = status;
    widget.note.save();
    Navigator.pop(context);
  }
}
