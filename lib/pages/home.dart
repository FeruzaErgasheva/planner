import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:plans_application/components/dialogbox.dart';
import 'package:plans_application/components/todotile.dart';
import 'package:plans_application/data/database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _mybox = Hive.box("mybox");
  //instantiate database object
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    //if this is ever 1 st time opening
    if (_mybox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  //refernce to box

  //taking data from controller
  TextEditingController _controller = TextEditingController();
  //checkbox clicked
  void checkboxChanged(int index, bool? value) {
    setState(() {
      db.todolist[index][1] = !db.todolist[index][1];
    });
    db.updateDatabase();
  }

  // delete task from page
  void deleteTask(int index) {
    setState(() {
      db.todolist.removeAt(index);
    });
    db.updateDatabase();
  }

  ///LIST OF TASKS

//cancels in dialoh box
  void cancelTask() {
    setState(() {
      Navigator.of(context).pop();
      _controller.clear();
    });
    db.updateDatabase();
  }

//save task
  void saveTask() {
    setState(() {
      if (_controller.text.isNotEmpty) {
        db.todolist.add([_controller.text, false]);
        Navigator.of(context).pop();
      } else {}
    });
    _controller.clear();
    db.updateDatabase();
  }

  //when floating button clicked
  void onClickedbutton() {
    setState(() {
      showDialog(
        context: context,
        builder: (context) => DialogBox(
            onCancel: cancelTask, onSave: saveTask, mycontroller: _controller),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      drawer: Drawer(
        backgroundColor: Colors.deepPurple[200],
        child: Column(
          children: [
            DrawerHeader(
              child: Icon(Icons.favorite),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, "/home");
              },
              title: Text("Home"),
              leading: Icon(Icons.home),
              trailing: Icon(Icons.star),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, "/completed");
              },
              title: Text("Completed"),
              leading: Icon(Icons.done_all_outlined),
              trailing: Icon(Icons.task_alt_outlined),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: db.todolist.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.todolist[index][0],
            onChanged: (value) => checkboxChanged(index, value),
            isCompleted: db.todolist[index][1],
            deleteTaskFully: (context) => deleteTask(index),
            // deleteTaskFully: (context) => deleteTask(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onClickedbutton,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}
