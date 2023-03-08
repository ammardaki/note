import 'package:hive_flutter/hive_flutter.dart';

class toDatabase {
  List toDolist = [];
  //reference the hive box
  final _mybox = Hive.box("MyBox");
  //run this method if this is the 1st time ever opening this app
  void createIntialData(){
   List toDolist = [
     ["Make", false],
     ["Do", false],
   ];
  }
  //load data from database
  void LoadData(){
toDolist=_mybox.get('TODOLIST');
  }
  //update data
  void UpdateData(){
_mybox.put('TODOLIST', toDolist);
  }
}
