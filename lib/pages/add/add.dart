import 'package:flutter/material.dart';

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
            padding: EdgeInsets.all(10.0), // 添加内边距
            decoration: BoxDecoration(
              color: Colors.blue[50], // 设置背景色
              borderRadius: BorderRadius.circular(10.0), // 设置圆角
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
    const NAMES = {
      'school name': ['school of computer', 'school of bis', ''],
      'subject': ['from db'],
      'staff name': ['宋江', '卢俊义', '吴用', '公孙胜', '关胜'],
    };

    return Container(
      color: Colors.blue[100],
      child: ListView(
        shrinkWrap: true,
        children: NAMES.keys.map((key) {
          return ExpansionTile(
            title: Text(
              key + (selected[key]!.isEmpty ? '' : ': ${selected[key]}'),
              style: TextStyle(
                color: Colors.black54,
                fontSize: 20,
              ),
            ),
            children: NAMES[key]!.map((name) {
              return ListTile(
                title: Text(
                  name,
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
                onTap: () {
                  setState(() {
                    selected[key] = name;
                  });
                },
              );
            }).toList(),
          );
        }).toList(),
      ),
    );
  }

  Widget writingArea(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.green[100],
      child: TextField(
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
                // Handle the submit action here
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    );
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
            )

        );
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

    // 五角星的五个顶点
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
