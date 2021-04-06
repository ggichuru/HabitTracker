import 'package:flutter/material.dart';
import 'package:habit_tracker/screens/welcome.dart';
import 'package:habit_tracker/utils/authentication.dart';
import 'package:habit_tracker/widgets/sidebar.dart';
import 'package:habit_tracker/widgets/sidemenu.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: sideMenu(),
    );
  }
}
