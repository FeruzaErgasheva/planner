
import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase{
  List todolist=[];
  final _mybox=Hive.box("mybox");

  //run this method if this is the first time ever opening
  void createInitialData(){
    todolist=[];
  }

  //load the data
  void loadData(){
    todolist=_mybox.get("TODOLIST");
  }

  //update the data
  void updateDatabase(){
    _mybox.put("TODOLIST", todolist);

  }
}