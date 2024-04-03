import 'package:flutter/material.dart';

// class TutorDetailPage extends StatelessWidget {
//   final int tutorId;
//   final String? tutorName;
//   final String? tutorImageUrl;
//
//   TutorDetailPage({
//     super.key,
//     required this.tutorId,
//     this.tutorName,
//     this.tutorImageUrl,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Tutor Detail'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             if (tutorImageUrl != null)
//               CircleAvatar(
//                 radius: 50,
//                 backgroundImage: NetworkImage(tutorImageUrl!),
//               ),
//             SizedBox(height: 16),
//             Text(
//               'Tutor ID: $tutorId',
//               style: TextStyle(fontSize: 18),
//             ),
//             if (tutorName != null)
//               SizedBox(height: 8),
//             if (tutorName != null)
//               Text(
//                 'Tutor Name: $tutorName',
//                 style: TextStyle(fontSize: 18),
//               ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.add),
//             label: 'Add',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//         ],
//         onTap: (int index) {
//           if (index == 0) {
//             Navigator.pop(context);
//           } else if (index == 1) {
//             Navigator.pushNamed(context, '/add');
//           } else if (index == 2) {
//             Navigator.pushNamed(context, '/profile');
//           }
//         },
//       ),
//     );
//   }
// }

class TutorDetailPage extends StatelessWidget {
  final int? tutorId;
  final String? tutorName;
  final String? tutorImageUrl;
  final double? rating;
  final String bio;

  TutorDetailPage({
    Key? key,
    required this.tutorId,
    required this.tutorName,
    required this.tutorImageUrl,
    this.rating, // 将rating属性设置为可选
    required this.bio,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tutor Detail'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
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
                if (rating != null) // 处理rating属性为空的情况
                  SizedBox(height: 8),
                if (rating != null)
                  Text(
                    'Rating: $rating',
                    style: TextStyle(fontSize: 18),
                  ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      'Contents',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ...bio.split('\n').map(
                        (paragraph) => Padding(
                      padding: EdgeInsets.all(16),
                      child: Text(
                        paragraph,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
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
