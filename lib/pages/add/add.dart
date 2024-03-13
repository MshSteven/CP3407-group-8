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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter 输入区域示例'),
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