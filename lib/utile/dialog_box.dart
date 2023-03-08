// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:todo/utile/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  final void Function()? onSave;
  final void Function()? onCancel;
  DialogBox({super.key,required this.controller,required this.onSave,required this.onCancel});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.orange[300],
      content: Container(
        height: 120.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: 'Create new task',
                border: OutlineInputBorder(),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButton(
                  text: 'Save',
                  onPressed:onSave,
                ),
                SizedBox(width: 8.0,),
                MyButton(
                  text: 'Cancel',
                  onPressed: onCancel,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
