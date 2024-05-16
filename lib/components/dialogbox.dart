import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {
  VoidCallback onSave;
  VoidCallback onCancel;
  final mycontroller;
  DialogBox(
      {super.key,
      required this.onCancel,
      required this.onSave,
      required this.mycontroller});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepPurple[200],
      content: Container(
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "New Task",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: mycontroller,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.deepPurple),
                      foregroundColor: MaterialStatePropertyAll(Colors.white),
                    ),
                    onPressed: onSave,
                    child: Text("Save")),
                TextButton(
                    style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.deepPurple),
                      foregroundColor: MaterialStatePropertyAll(Colors.white),
                    ),
                    onPressed: onCancel,
                    child: Text("Cancel"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
