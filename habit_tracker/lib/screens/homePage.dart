import 'package:flutter/material.dart';
import 'package:habit_tracker/screens/welcome.dart';
import 'package:habit_tracker/utils/authentication.dart';
import 'package:habit_tracker/widgets/sidebar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isProcessing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: Container(
      //   padding: EdgeInsets.all(20),
      //   child: Column(
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   children: [
      //     Text('WELCOME HOME', style: TextStyle(color: Colors.black, fontSize: 24 ),),
      //     SizedBox(height: 30,),
      //     ElevatedButton(
      //         // onPressed: () {
      //         //   FirebaseAuth.instance.signOut().then((value) => {
      //         //         Navigator.pushAndRemoveUntil(
      //         //             context,
      //         //             MaterialPageRoute(
      //         //                 builder: (context) => WelcomeScreen()),
      //         //             (route) => false)
      //         //       });
      //         // },
      //         onPressed: _isProcessing
      //             ? null
      //             : () async {
      //                 setState(() {
      //                   _isProcessing = true;
      //                 });
      //                 await signOut().then((result) {
      //                   print(result);
      //                   Navigator.of(context).pushReplacement(
      //                     MaterialPageRoute(
      //                       fullscreenDialog: true,
      //                       builder: (context) => WelcomeScreen(),
      //                     ),
      //                   );
      //                 }).catchError((error) {
      //                   print('Sign Out Error: $error');
      //                 });
      //                 setState(() {
      //                   _isProcessing = false;
      //                 });
      //               },
      //         child: Text('Signout')),
      //   ],
      // ),
      // ),
      
      body: SideBar(),
    );
  }
}
