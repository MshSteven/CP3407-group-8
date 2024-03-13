import 'package:flutter/material.dart';
import 'package:project/pages/home/home.dart';
import 'package:project/pages/add/add.dart';
import 'package:project/pages/profile/profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, String> selected = {
    'school name': '',
    'subject': '',
    'staff name': '',
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/add': (context) => AddRouter(), // Add page (current page)
        '/profile': (context) => ProfileRoute(), // Profile page
      },
      home: FirstRoute(),
    );
  }
}






