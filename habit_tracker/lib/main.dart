import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:habit_tracker/screens/homePage.dart';
import 'package:habit_tracker/screens/welcome.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Habit Tracker',
      debugShowCheckedModeBanner: false,
      //theme: ThemeData(primarySwatch: Colors.blue),
      theme: ThemeData.dark(),
      home: AuthWrapper(),
      //themeMode: ThemeMode.system,
    );
  }
}

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = FirebaseAuth.instance.currentUser;

    if (firebaseUser != null) {
      return HomePage();
    }
    return WelcomeScreen();
  }
}
