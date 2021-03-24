import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

bool authSignedIn;
String uid;
String userEmail;

Future<String> registerWithEmailPassword(String email, String password) async {
  // Init Firebase
  await Firebase.initializeApp();

  final UserCredential userCredential = await _auth
      .createUserWithEmailAndPassword(email: email, password: password);
  final User user = userCredential.user;

  if (user != null) {
    assert(user.uid != null);
    assert(user.email != null);

    uid = user.uid;
    userEmail = user.email;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    return 'Successfully registerd, User UID: ${user.uid}';
  }
  return null;
}
