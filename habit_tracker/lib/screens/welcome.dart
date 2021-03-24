import 'package:flutter/material.dart';
import 'package:habit_tracker/widgets/callToAction.dart';
import 'package:habit_tracker/widgets/centeredView.dart';
import 'package:habit_tracker/widgets/habitDetails.dart';
import 'package:habit_tracker/widgets/navigation.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 1000),
        child: Container(
          color: Colors.black.withOpacity(0.35),
          child: Padding(
            padding: EdgeInsets.all(20),
            child: NavigationBar(),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.29,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    'images/habits3.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                CenteredView(
                  child: Row(
                    children: [
                      HabitsDetails(),
                      Expanded(child: Center(
                        child: CallToAction('Start Tracking'),
                      ))
                      ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      // body: Container(
      //   child: Column(
      //     children: [
      //       Container(
      //         height: MediaQuery.of(context).size.height * 0.35,
      //         width: MediaQuery.of(context).size.width,
      //         child: Image.asset(
      //           'images/habits3.jpg',
      //           fit: BoxFit.cover,
      //         ),
      //       ),
      //     ],
      //   ),

      // ),

      // child: Stack(
      //   children: [

      //     SizedBox(height: 59,),
      //     CenteredView(
      //       child: Column(
      //         children: [
      //           Expanded(
      //             child: Row(
      //               children: [

      //                 HabitsDetails(),
      //                 Expanded(child: Center(
      //                   child: CallToAction('Start Tracking'),
      //                 ))
      //               ],
      //             ),
      //           )
      //         ],
      //       ),
      //     )
      //   ],
      // ),
    );
  }
}
