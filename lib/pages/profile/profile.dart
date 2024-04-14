import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class ProfileRoute extends StatelessWidget {
  // final Database database; // 添加一个名为database的参数

  // ProfileRoute({required this.database}); // 构造函数中初始化database参数

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Column(

      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (int index) {
          if (index == 0) {Navigator.pop(context);
            // Home button pressed
            // You can optionally add code here to navigate to the home route
          } else if (index == 1) {
            // Add button pressed
            Navigator.pushNamed(context, '/add');
          } else if (index == 2) {
            // Profile button pressed
            // Navigator.pushNamed(context, '/profile');
          }
        },
      ),
    );
  }

}

