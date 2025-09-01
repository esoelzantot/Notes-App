import 'package:flutter/material.dart';

AppBar buildAppBar() {
  return AppBar(
    elevation: 0,
    title: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: const Text(
        "Mhamy",
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
      ),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: IconButton(
          style: IconButton.styleFrom(
            backgroundColor: Colors.grey.withAlpha(50),
            iconSize: 30,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          onPressed: () {},
          icon: const Icon(Icons.search, color: Colors.white),
        ),
      ),
    ],
  );
}
