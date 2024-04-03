import 'package:flutter/material.dart';
import 'package:project/pages/home/home.dart';
import 'package:project/pages/add/add.dart';
import 'package:project/pages/profile/profile.dart';
import 'package:project/pages/tutor_detail/detail.dart';

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
        '/add': (context) => AddRouter(),
        '/profile': (context) => ProfileRoute(),
        '/detail': (context) {
          final arguments = ModalRoute.of(context)?.settings.arguments;
          if (arguments is Map<String, dynamic>) {
            return TutorDetailPage(
              tutorId: arguments['tutorId'] as int,
              tutorName: arguments['tutorName'] as String?,
              tutorImageUrl: arguments['tutorImageUrl'] as String?,
            );
          }
          return TutorDetailPage(tutorId: 0); // or throw an error
        },
      },      home: FirstRoute(),
    );
  }
}