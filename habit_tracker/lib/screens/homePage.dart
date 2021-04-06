import 'package:flutter/material.dart';
import 'package:habit_tracker/screens/pages.dart';
import 'package:habit_tracker/widgets/sidemenu.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyHomePage(),
    );
  }
}
