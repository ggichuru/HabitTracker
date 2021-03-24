import 'package:flutter/material.dart';

class NavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text('HABIT TRACKER',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 35)),
        Expanded(
          child: Row(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _NavBarItem('Contact us'),
              SizedBox(width: MediaQuery.of(context).size.width / 20),
              _NavBarItem('About'),
            ],
          ),
        ),
        _NavBarItem('Login'),
        SizedBox(width: MediaQuery.of(context).size.width / 50),
        _NavBarItem('SignUp')
      ],
    );
  }
}

class _NavBarItem extends StatefulWidget {
  final String title;

  const _NavBarItem(this.title, {Key key}) : super(key: key);

  @override
  __NavBarItemState createState() => __NavBarItemState();
}

class __NavBarItemState extends State<_NavBarItem> {
  //List _isHovering = [false, false, false, false];
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onHover: (value) {
        setState(() {
          _isHovering = value;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(widget.title,
              style: TextStyle(
                  color: _isHovering ? Colors.blue[100] : Colors.white,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 5,),
          Visibility(
            maintainAnimation: true,
            maintainState: true,
            maintainSize: true,
            visible: _isHovering,
            child: Container(
              height: 2,
              width: 20,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
