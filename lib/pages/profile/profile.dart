import 'package:flutter/material.dart';

class ProfileRoute extends StatelessWidget {

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

