import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:curved_drawer/curved_drawer.dart';

class sideMenu extends StatefulWidget {
  final String title;

  const sideMenu({Key key, this.title}) : super(key: key);

  @override
  _sideMenuState createState() => _sideMenuState();
}

class _sideMenuState extends State<sideMenu> {
  int index = 0;
  double leftWidth = 75.0;
  int leftTextColor = 1;
  int leftBackgroundColor = 0;
  double rightWidth = 75.0;
  int rightTextColor = 1;
  int rightBackgroundColor = 0;

  final List<Color> colorPallete = <Color>[
    Colors.white,
    Colors.black,
    Colors.blue,
    Colors.blueAccent,
    Colors.red,
    Colors.redAccent,
    Colors.teal,
    Colors.orange,
    Colors.pink,
    Colors.purple,
    Colors.lime,
    Colors.green
  ];

  final List<DrawerItem> _drawerItems = <DrawerItem>[
    DrawerItem(icon: Icon(Icons.people), label: "People"),
    DrawerItem(icon: Icon(Icons.trending_up), label: "Trending"),
    DrawerItem(icon: Icon(Icons.tv)),
    DrawerItem(icon: Icon(Icons.work), label: "Work"),
    DrawerItem(icon: Icon(Icons.web)),
    DrawerItem(icon: Icon(Icons.videogame_asset)),
    DrawerItem(icon: Icon(Icons.book), label: "Book"),
    DrawerItem(icon: Icon(Icons.call), label: "Telephone"),
    DrawerItem(icon: Icon(Icons.ac_unit_outlined), label: "all")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
      ),
      drawer: CurvedDrawer(
        index: index,
        width: leftWidth,
        color: colorPallete[leftBackgroundColor],
        buttonBackgroundColor: colorPallete[leftBackgroundColor],
        labelColor: colorPallete[leftTextColor],
        isEndDrawer: true,
        items: _drawerItems,
        onTap: (newIndex) {
          setState(() {
            index = newIndex;
          });
        },
      ),
      // endDrawer: CurvedDrawer(
      //   index: index,
      //   width: rightWidth,
      //   color: colorPallete[rightBackgroundColor],
      //   buttonBackgroundColor: colorPallete[rightBackgroundColor],
      //   labelColor: colorPallete[rightTextColor],
      //   isEndDrawer: true,
      //   items: _drawerItems,
      //   onTap: (newIndex){
      //     setState(() {
      //       index = newIndex;
      //     });
      //   },
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Current index is $index',
            ),
            SizedBox(height: 15,),
            Text("Left Width = $leftWidth"),
            Slider(
              label: "Left Drawer Width",
              activeColor: Colors.blue,
              min: 50.0,
              max: 100.0,
              divisions: 50,
              value: leftWidth,
              onChanged: (value) => setState(()=> leftWidth = value),
            ),
            SizedBox(height: 15,),
            SliderTheme(
              child: Slider(
                label: "Left Drawer Background Color",
                activeColor: colorPallete[leftBackgroundColor],
                min: 0,
                max: colorPallete.length.toDouble()-1.0,
                divisions: colorPallete.length,
                value: leftBackgroundColor.toDouble(),
                onChanged: (value) => setState((){ leftBackgroundColor = value.toInt();}),
              ),
              data: SliderThemeData(
                valueIndicatorTextStyle:  TextStyle(color: Colors.grey)
              )
            ),
            SizedBox(height: 15,),
            SliderTheme(
              child: Slider(
                label: "Left Drawer Label Color",
                activeColor: colorPallete[leftTextColor],
                min: 0,
                max: colorPallete.length.toDouble()-1.0,
                divisions: colorPallete.length,
                value: leftTextColor.toDouble(),
                onChanged: (value) => setState((){ leftTextColor = value.toInt();}),
              ),
              data: SliderThemeData(
                valueIndicatorTextStyle: TextStyle(color: Colors.grey)
              )
            ),
            SizedBox(height: 15,),
            Text("Right Width = $rightWidth"),
            Slider(
              label: "Right Drawer Width",
              activeColor: Colors.blue,
              min: 50.0,
              max: 100.0,
              divisions: 50,
              value: rightWidth,
              onChanged: (value) => setState(()=> rightWidth = value),
            ),
            SizedBox(height: 15,),
            SliderTheme(
              child: Slider(
                label: "Right Drawer Background Color",
                activeColor: colorPallete[rightBackgroundColor],
                min: 0,
                max: colorPallete.length.toDouble()-1.0,
                divisions: colorPallete.length,
                value: rightBackgroundColor.toDouble(),
                onChanged: (value) => setState((){ rightBackgroundColor = value.toInt();}),
              ),
              data: SliderThemeData(
                valueIndicatorTextStyle: TextStyle(color: Colors.grey)
              )
            ),
            SizedBox(height: 15,),
            SliderTheme(
              child: Slider(
                label: "Right Drawer Label Color",
                activeColor: colorPallete[rightTextColor],
                min: 0,
                max: colorPallete.length.toDouble()-1.0,
                divisions: colorPallete.length,
                value: rightTextColor.toDouble(),
                onChanged: (value) => setState((){ rightTextColor = value.toInt();}),
              ),
              data: SliderThemeData(
                valueIndicatorTextStyle: TextStyle(color: Colors.grey)
              )
            ),
          ],
        ),
      ),
    );
  }
}
