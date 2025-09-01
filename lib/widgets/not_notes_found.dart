import 'package:flutter/material.dart';

class NotNotesFound extends StatelessWidget {
  const NotNotesFound({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.white.withOpacity(0.2),
                width: 1,
              ),
            ),
            child: Icon(
              Icons.note_add_outlined,
              size: 80,
              color: Colors.white.withOpacity(0.7),
            ),
          ),
          SizedBox(height: 24),
          Text(
            "لا توجد ملاحظات",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              letterSpacing: 0.5,
            ),
          ),
          SizedBox(height: 12),
          Text(
            "ابدأ بإنشاء ملاحظتك الأولى",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.white.withAlpha(200),
              letterSpacing: 0.3,
            ),
          ),
        ],
      ),
    );
  }
}
