// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
class MyButton extends StatelessWidget {
  final String text;
final void Function()? onPressed;
MyButton({required this.text,required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: onPressed,color: Theme.of(context).primaryColor,
    child: Text(text),
    );
  }
}