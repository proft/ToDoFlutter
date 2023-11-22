import 'package:flutter/material.dart';
import 'package:todo_flutter/helpers/dialog_button.dart';

class DialogBox extends StatelessWidget {
  TextEditingController controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({super.key, required this.controller, required this.onSave, required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.green[200],
      content: Container(
        height: 130,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: controller,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter your task"
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  DialogButton(text: "Save", onPressed: onSave),
                  const SizedBox(width: 10),
                  DialogButton(text: "Cancel", onPressed: onCancel),
                ],
              ),
            ]),
      ),
    );
  }
}
