import 'package:flutter/material.dart';

class CallToAction extends StatefulWidget {
  final String title;
  const CallToAction(this.title);

  @override
  _CallToActionState createState() => _CallToActionState();
}

class _CallToActionState extends State<CallToAction> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: null,
      onHover: (value) {
        setState(() {
          _isHovering = value;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
        child: Text(
          widget.title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: !_isHovering ? Colors.black : Colors.yellowAccent[700],
          ),
        ),
        decoration: BoxDecoration(
            color: !_isHovering ? Colors.yellowAccent[700] : Colors.black,
            borderRadius: BorderRadius.circular(5)),
      ),
    );
  }
}