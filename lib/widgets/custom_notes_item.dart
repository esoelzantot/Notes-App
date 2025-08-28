import 'package:flutter/material.dart';
import 'package:notes_app/views/edit_notes_view.dart';

class CustomNotesItem extends StatefulWidget {
  const CustomNotesItem({super.key});

  @override
  State<CustomNotesItem> createState() => _CustomNotesItemState();
}

class _CustomNotesItemState extends State<CustomNotesItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.greenAccent.withAlpha(200),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          ListTile(
            title: Text(
              "Note Title",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              "Note Subtitle Note Subtitle Note Subtitle Note Subtitle Note Subtitle Note Subtitle Note Subtitle Note Subtitle",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black.withAlpha(250),
                fontStyle: FontStyle.italic,
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
                    onPressed: () {},
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
                            return EditNotesView();
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
                  "22 Mar 2022",
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
