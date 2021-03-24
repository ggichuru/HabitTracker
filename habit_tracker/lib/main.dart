import 'package:flutter/material.dart';
import 'package:habit_tracker/screens/welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Habit Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
     // theme: ThemeData.dark(),
      home: WelcomeScreen(),
    );
  }
}
