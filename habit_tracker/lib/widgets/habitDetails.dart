import 'package:flutter/material.dart';

class HabitsDetails extends StatelessWidget {
  const HabitsDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'HABIT TRACKER',
             style: TextStyle(
                fontWeight: FontWeight.w800, fontSize: 80, height: 0.9),
          ),
          SizedBox(height: 30),
          Text(
            'In this course we will go over the basics of using Flutter Web for website development. '
            'Topics will include Responsive Layout, Deploying, Font Changes, Hover Functionality, Modals and more. '
            'Firebase Authentication provides backend services & easy-to-use SDKs to authenticate users to your app. '
            'It supports authentication using passwords, phone numbers, popular federated identity providers like Google, Facebook and Twitter, and more.',
            style: TextStyle(fontSize: 21, height: 1.7),
          )
        ],
      ),
    );
  }
}
