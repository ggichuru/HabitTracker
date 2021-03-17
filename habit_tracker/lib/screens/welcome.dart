import 'package:flutter/material.dart';
import 'package:habit_tracker/widgets/centeredView.dart';
import 'package:habit_tracker/widgets/navigation.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CenteredView(
        child: Column(
          children: <Widget>[
            NavigationBar()
          ],
        ),
      ),
    );
  }
}
