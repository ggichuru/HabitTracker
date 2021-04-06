import 'package:flutter/material.dart';
import 'package:collapsible_sidebar/collapsible_sidebar.dart';
import 'dart:math' as math show pi;

import 'package:habit_tracker/screens/pages.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  List<CollapsibleItem> _items;
  String _headline;

  @override
  void initState() {
    super.initState();
    _items = _generatedItems;
    _headline = _items.firstWhere((item) => item.isSelected).text;
  }

  List<CollapsibleItem> get _generatedItems {
    return [
      CollapsibleItem(
        text: 'Dashboard',
        icon: Icons.assessment,
        onPressed: () => setState(() => _headline = 'Homepage'),
        isSelected: true,
      ),
      CollapsibleItem(
        text: 'Errors',
        icon: Icons.cancel,
        onPressed: () => setState(() => _headline = 'Errors'),
      ),
      CollapsibleItem(
        text: 'Search',
        icon: Icons.search,
        onPressed: () => setState(() => _headline = 'Search'),
      ),
      CollapsibleItem(
        text: 'Notifications',
        icon: Icons.notifications,
        onPressed: () => setState(() => _headline = 'Notifications'),
      ),
      CollapsibleItem(
        text: 'Settings',
        icon: Icons.settings,
        onPressed: () => setState(() => _headline = 'Settings'),
      ),
      CollapsibleItem(
        text: 'Home',
        icon: Icons.home,
        onPressed: () => setState(() => _headline = 'Home'),
      ),
      CollapsibleItem(
        text: 'Alarm',
        icon: Icons.access_alarm,
        onPressed: () => setState(() => _headline = 'Alarm'),
      ),
      CollapsibleItem(
        text: 'Eco',
        icon: Icons.eco,
        onPressed: () => setState(() => _headline = 'Eco'),
      ),
      CollapsibleItem(
        text: 'Event',
        icon: Icons.event,
        onPressed: () => setState(() => _headline = 'Event'),
      ),
      CollapsibleItem(
        text: 'Email',
        icon: Icons.email,
        onPressed: () => setState(() => _headline = 'Email'),
      ),
      CollapsibleItem(
        text: 'Face',
        icon: Icons.face,
        onPressed: () => setState(() => _headline = 'Face'),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: CollapsibleSidebar(
        items: _items,
        title: 'David Goliath',
        body: _body(size, context),
        backgroundColor: Colors.black,
        selectedTextColor: Colors.limeAccent,
        textStyle: TextStyle(
          fontSize: 19,
        ),
        titleStyle: TextStyle(
            fontSize: 20,
            // fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold),
        toggleTitleStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _body(Size size, BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.white,
      child: Center(
        child: Text(
          _headline,
          style: Theme.of(context).textTheme.headline1,
          overflow: TextOverflow.visible,
          softWrap: false,
        ),
      ),
    );
  }
}
