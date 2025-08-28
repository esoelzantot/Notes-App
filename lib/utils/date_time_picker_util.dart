import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimePickerUtil {
  static const String _defaultFormat = "dd MMM yyyy";
  static const Duration _hundredYears = Duration(days: 365 * 100);

  static Future<DateTime?> pickDateTime({
    required BuildContext context,
    DateTime? initialDateTime,
    TextEditingController? controller,
    String formatPattern = _defaultFormat,
    bool showSnackbarOnError = true,
  }) async {
    try {
      final pickedDate = await _pickDate(context, initialDateTime);
      if (pickedDate == null) return null;

      // Only pick date, no time needed
      controller?.text = _formatDateTime(pickedDate, formatPattern);
      return pickedDate;
    } catch (e) {
      _handleError(context, e, showSnackbarOnError);
      return null;
    }
  }

  static Future<DateTime?> pickDateOnly({
    required BuildContext context,
    DateTime? initialDateTime,
    TextEditingController? controller,
    String formatPattern = _defaultFormat,
    bool showSnackbarOnError = true,
  }) async {
    try {
      final pickedDate = await _pickDate(context, initialDateTime);
      if (pickedDate == null) return null;

      controller?.text = _formatDateTime(pickedDate, formatPattern);
      return pickedDate;
    } catch (e) {
      _handleError(context, e, showSnackbarOnError);
      return null;
    }
  }

  static Future<DateTime?> _pickDate(
    BuildContext context,
    DateTime? initialDate,
  ) {
    return showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(_hundredYears),
      selectableDayPredicate: (_) => true,
    );
  }

  static Future<TimeOfDay?> _pickTime(
    BuildContext context,
    DateTime? initialDate,
  ) {
    return showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(initialDate ?? DateTime.now()),
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          timePickerTheme: const TimePickerThemeData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
          ),
        ),
        child: child!,
      ),
    );
  }

  // Updated formatting method to handle the new format
  static String _formatDateTime(DateTime dateTime, String formatPattern) {
    return DateFormat(formatPattern).format(dateTime);
  }

  // Helper method to parse date from the "22 May 2025" format
  static DateTime? parseDate(
    String dateString, {
    String formatPattern = _defaultFormat,
  }) {
    try {
      return DateFormat(formatPattern).parse(dateString);
    } catch (e) {
      debugPrint('Error parsing date: $dateString with format: $formatPattern');
      return null;
    }
  }

  static void _handleError(
    BuildContext context,
    dynamic error,
    bool showSnackbar,
  ) {
    debugPrint('DateTimePicker Error: $error');
    if (showSnackbar && context.mounted) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Failed to pick date/time')));
    }
  }

  static Widget buildDateTimePickerField({
    required BuildContext context,
    required TextEditingController controller,
    String labelText = 'Date & Time',
    String hintText = 'Tap to select date and time',
    String? Function(String?)? validator,
    ValueChanged<String?>? onChanged,
    DateTime? initialDateTime,
    String formatPattern = _defaultFormat,
    bool dateOnly = false, // New parameter to choose date only
    EdgeInsets? margin,
    InputDecoration? decoration,
  }) {
    return GestureDetector(
      onTap: () {
        if (dateOnly) {
          pickDateOnly(
            context: context,
            initialDateTime: initialDateTime,
            controller: controller,
            formatPattern: formatPattern,
          );
        } else {
          pickDateTime(
            context: context,
            initialDateTime: initialDateTime,
            controller: controller,
            formatPattern: formatPattern,
          );
        }
      },
      child: Container(
        margin: margin,
        child: AbsorbPointer(
          child: TextFormField(
            controller: controller,
            decoration:
                decoration ??
                _defaultDecoration(labelText: labelText, hintText: hintText),
            validator: validator,
            onChanged: onChanged,
            readOnly: true,
          ),
        ),
      ),
    );
  }

  static InputDecoration _defaultDecoration({
    required String labelText,
    required String hintText,
  }) {
    return InputDecoration(
      labelText: labelText,
      hintText: hintText,
      suffixIcon: const Icon(Icons.calendar_today),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.grey),
      ),
    );
  }
}
