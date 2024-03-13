import 'package:flutter/material.dart';

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
      home: Scaffold(
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
              child: writingArea(context),
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
        ),
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
      color: Colors.blue[100], // 添加颜色
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
      color: Colors.green[100], // 添加颜色
      child: TextField(
        maxLines: null,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'writingArea',
        ),
      ),
    );
  }
}
