import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/data/database.dart';
import 'package:todo/utile/dialog_box.dart';
import 'package:todo/utile/to_do_title.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //refernce the hive box
  final _mybox = Hive.box("MyBox");
  final _controller = TextEditingController();
  toDatabase db = toDatabase();
  @override
  void initState() {
    // if this is the 1st time ever openin the app, then create default data
    if (_mybox.get('TODOLIST') == null) {
      db.createIntialData();
    }
    else{
      //there is already data
      db.LoadData();
    }
    super.initState();
  }

  //checkbox
  void CheckboxChanged(bool value, int index) {
    setState(() {
      db.toDolist[index][1] = !db.toDolist[index][1];
    });
    db.UpdateData();
  }

  //CreateNewTasks
  void CreateNewTask() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return DialogBox(
          controller: _controller,
          onSave: SaveNewTask,
          onCancel: () => Navigator.pop(context),
        );
      },
    );
  }

  //SaveNewTask
  void SaveNewTask() {
    setState(() {
      db.toDolist.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.UpdateData();
  }

//delet task
  void deletTask(int index) {
    setState(() {
      db.toDolist.removeAt(index);
    });
    db.UpdateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange[300],
        appBar: AppBar(
          title: Text("To Do"),
          centerTitle: true,
          elevation: 0.0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: CreateNewTask,
          child: Icon(
            Icons.add,
          ),
        ),
        body: ListView.builder(
          itemCount: db.toDolist.length,
          itemBuilder: (context, index) {
            return Todolist(
              taskname: db.toDolist[index][0],
              taskcompleted: db.toDolist[index][1],
              OnChange: (value) => CheckboxChanged(value!, index),
              deletFunction: (context) => deletTask(index),
            );
          },
        ));
  }
}
