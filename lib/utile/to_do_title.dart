import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Todolist extends StatelessWidget {
  final String taskname;
  final bool taskcompleted;
  final Function(bool?)? OnChange;
  final void Function(BuildContext)? deletFunction;

  const Todolist(
      {super.key,
      required this.taskname,
      required this.taskcompleted,
      required this.OnChange,
      required this.deletFunction});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 25.0,
        top: 25.0,
        right: 25.0,
      ),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deletFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(13.0),
            )
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(24),
          child: Row(
            children: [
              //checkbox
              Checkbox(
                onChanged: OnChange,
                value: taskcompleted,
                activeColor: Colors.black,
              ),
              //title tasks
              Text(
                taskname,
                style: TextStyle(
                  decoration: taskcompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.orange, borderRadius: BorderRadius.circular(13)),
        ),
      ),
    );
  }
}
