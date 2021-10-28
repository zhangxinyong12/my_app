import 'package:flutter/material.dart';

import 'package:flutter_application_1/pages/home/home.dart';
import 'package:flutter_application_1/pages/business/business.dart';
import 'package:flutter_application_1/pages/school/school.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 1;
  List _pagesList = [Home(), Business(), School()];
  List _titleList = [
    Text("首页"),
    Text("business"),
    Text("school"),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "DEMO",
      home: Scaffold(
        appBar: AppBar(
          title: _titleList[_selectedIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: ('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: ('Business'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: ('School'),
            ),
          ],
          currentIndex: _selectedIndex,
          fixedColor: Colors.red,
          unselectedIconTheme: IconThemeData(
            color: Colors.green,
          ),
          unselectedItemColor: Colors.green,
          onTap: _onItemTapped,
        ),
        body: Container(
          child: _pagesList[_selectedIndex],
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
