import 'package:flutter/material.dart';
import 'data.dart';

class AddRouter extends StatefulWidget {
  @override
  _AddRouterState createState() => _AddRouterState();
}

class _AddRouterState extends State<AddRouter> {
  Map<String, String> selected = {
    'school name': '',
    'subject': '',
    'staff name': '',
  };

  int _selectedRating = 0;

  List<String> subjects = [];
  List<String> tutors = [];
  TextEditingController _writingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Content'),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            flex: 2,
            child: Container(
              padding: EdgeInsets.all(20),
              child: staffList(),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: RatingBar(_selectedRating, (rating) {
              setState(() {
                _selectedRating = rating;
              });
            }),
          ),
          Flexible(
            flex: 1,
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: writingArea(context),
            ),
          ),
          Container(
            child: submitButton(context),
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
            // Home button pressed
            Navigator.pop(context);
          } else if (index == 1) {
            // Add button pressed
            // You can optionally add code here to handle the Add button press
          } else if (index == 2) {
            // Profile button pressed
            Navigator.pushNamed(context, '/profile');
          }
        },
      ),
    );
  }

  Widget staffList() {
    return Container(
      color: Colors.blue[100],
      child: ListView(
        shrinkWrap: true,
        children: [
          ExpansionTile(
            title: Text(
              'school name' +
                  (selected['school name']!.isEmpty
                      ? ''
                      : ': ${selected['school name']}'),
              style: TextStyle(
                color: Colors.black54,
                fontSize: 20,
              ),
            ),
            children: schools
                .map((school) => school.name)
                .map((name) => ListTile(
              title: Text(
                name,
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              onTap: () {
                setState(() {
                  selected['school name'] = name;
                  subjects = subjectsData
                      .where((subject) =>
                  subject.schoolName == name)
                      .map((subject) => subject.code)
                      .toList();
                  tutors = tutorsData
                      .where((tutor) =>
                  tutor.schoolName == name)
                      .map((tutor) => tutor.name)
                      .toList();
                });
              },
            ))
                .toList(),
          ),
          ExpansionTile(
            title: Text(
              'subject' +
                  (selected['subject']!.isEmpty
                      ? ''
                      : ': ${selected['subject']}'),
              style: TextStyle(
                color: Colors.black54,
                fontSize: 20,
              ),
            ),
            children: subjects
                .map((subject) => ListTile(
              title: Text(
                subject,
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              onTap: () {
                setState(() {
                  selected['subject'] = subject;
                  tutors = subjectsData
                      .where((subj) =>
                  subj.schoolName ==
                      selected['school name'] &&
                      subj.code == subject)
                      .map((subj) => subj.tutorName)
                      .toList();
                });
              },
            ))
                .toList(),
          ),
          ExpansionTile(
            title: Text(
              'staff name' +
                  (selected['staff name']!.isEmpty
                      ? ''
                      : ': ${selected['staff name']}'),
              style: TextStyle(
                color: Colors.black54,
                fontSize: 20,
              ),
            ),
            children: tutors
                .map((tutor) => ListTile(
              title: Text(
                tutor,
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              onTap: () {
                setState(() {
                  selected['staff name'] = tutor;
                });
              },
            ))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget writingArea(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.green[100],
      child: TextField(
        controller: _writingController,
        maxLines: null,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'writingArea',
        ),
      ),
    );
  }

  Widget submitButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.red[100],
      height: 90,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                handleSubmit();
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }

  void handleSubmit() {
    String schoolName = selected['school name']!;
    String subject = selected['subject']!;
    String staffName = selected['staff name']!;
    String writing = _writingController.text;
    int rating = _selectedRating;

    // Create a new RateAndReview object
    RateAndReview newReview = RateAndReview(
      userId: 0, // You can set this to the actual user ID if needed
      tutorName: staffName,
      rate: rating,
      review: writing,
    );

    // Print the new review (you can modify this to save it to a database or perform other actions)
    print('$schoolName $subject $staffName $writing $rating');

    // Reset the state to initial values
    setState(() {
      selected = {
        'school name': '',
        'subject': '',
        'staff name': '',
      };
      _selectedRating = 0;
      _writingController.clear();
      subjects = [];
      tutors = [];
    });
  }

}

class RatingBar extends StatelessWidget {
  final int selectedRating;
  final ValueChanged<int> onRatingUpdate;

  RatingBar(this.selectedRating, this.onRatingUpdate);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return GestureDetector(
            onTap: () => onRatingUpdate(index + 1),
            child: CustomPaint(
              painter: StarShape(_getColor(index + 1)),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 2.0),
                width: 20,
                height: 20,
              ),
            ));
      }),
    );
  }

  Color _getColor(int index) {
    if (index <= selectedRating) {
      if (selectedRating <= 2) {
        return Colors.red;
      } else if (selectedRating == 3) {
        return Colors.yellow;
      } else {
        return Colors.green;
      }
    } else {
      return Colors.grey;
    }
  }
}

class StarShape extends CustomPainter {
  final Color color;

  StarShape(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint();
    paint.color = color;
    paint.style = PaintingStyle.fill;

    final Path path = Path();
    final double width = size.width;
    final double height = size.height;

    final List<Offset> starPoints = [
      Offset(width / 2, 0),
      Offset(width * 0.8, height),
      Offset(0, height * 0.3),
      Offset(width, height * 0.3),
      Offset(width * 0.2, height),
    ];

    path.moveTo(starPoints[0].dx, starPoints[0].dy);
    for (int i = 1; i < starPoints.length; i++) {
      path.lineTo(starPoints[i].dx, starPoints[i].dy);
    }
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
