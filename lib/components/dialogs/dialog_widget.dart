import 'package:flutter/material.dart';

class Dialogs {
  static final Dialogs _singleton = Dialogs._internal();

  Dialogs._internal();

  factory Dialogs() {
    return _singleton;
  }

  static Widget questionStartDialogue({required VoidCallback onTap}) {
    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Привет",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Чтобы продолжить нужно авторизоваться...",
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            "Это быстро. Правда",
            style: TextStyle(fontSize: 10),
          ),
        ],
      ),
      actions: [TextButton(onPressed: onTap, child: const Text("Confirm"))],
    );
  }
}
