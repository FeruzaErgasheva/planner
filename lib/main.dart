import 'package:flutter/material.dart';
import 'package:plans_application/pages/completed.dart';
import 'package:plans_application/pages/home.dart';
import 'package:hive_flutter/hive_flutter.dart';


void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox("mybox");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        "/home": (context) => HomePage(),
        "/completed": (context) => CompletedTasksPage(),
      },
    );
  }
}
