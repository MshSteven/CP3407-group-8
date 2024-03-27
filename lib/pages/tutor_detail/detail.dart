import 'package:flutter/material.dart';

class TutorDetailPage extends StatelessWidget {
  final int tutorId;
  final String? tutorName;
  final String? tutorImageUrl;

  TutorDetailPage({
    super.key,
    required this.tutorId,
    this.tutorName,
    this.tutorImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tutor Detail'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (tutorImageUrl != null)
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(tutorImageUrl!),
              ),
            SizedBox(height: 16),
            Text(
              'Tutor ID: $tutorId',
              style: TextStyle(fontSize: 18),
            ),
            if (tutorName != null)
              SizedBox(height: 8),
            if (tutorName != null)
              Text(
                'Tutor Name: $tutorName',
                style: TextStyle(fontSize: 18),
              ),
          ],
        ),
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
          if (index == 0) {
            Navigator.pop(context);
          } else if (index == 1) {
            Navigator.pushNamed(context, '/add');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/profile');
          }
        },
      ),
    );
  }
}