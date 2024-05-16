import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

///I should add slidable action
class ToDoTile extends StatelessWidget {
  String taskName;
  Function(bool?)? onChanged;
  bool isCompleted;
  Function(BuildContext)? deleteTaskFully;
  ToDoTile(
      {super.key,
      required this.taskName,
      required this.onChanged,
      required this.isCompleted,
      required this.deleteTaskFully});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(motion: StretchMotion(), children: [
        SlidableAction(
          onPressed: deleteTaskFully,
          icon: Icons.delete,
          backgroundColor: Colors.red,
        )
      ]),
      child: Container(
        margin: EdgeInsets.all(25),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.deepPurple[200]),
        child: Row(
          children: [
            Checkbox(value: isCompleted, onChanged: onChanged),
            Text(
              taskName,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  decoration: isCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none),
            )
          ],
        ),
      ),
    );
  }
}
