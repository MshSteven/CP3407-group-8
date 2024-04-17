import 'package:flutter/material.dart';
import 'package:project/pages/add/data.dart';

class ProfileRoute extends StatefulWidget {
  final List<RateAndReview> rateAndReviews;

  ProfileRoute({required this.rateAndReviews});

  @override
  _ProfileRouteState createState() => _ProfileRouteState();
}

class _ProfileRouteState extends State<ProfileRoute> {
  String selectedHistoryText = '';
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // 初始化 selectedhistorys 列表
    List<String> selectedhistorys =
    widget.rateAndReviews.map((review) => review.toHistoryContent()).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Column(
        children: [
          // User information card
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40.0,
                ),
                SizedBox(height: 16.0),
                Text(
                  'User Name', // Replace with actual user name
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          // About Me section
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'About Me:',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Personal Interests: ...', // Replace with user's personal interests
                ),
                SizedBox(height: 8.0),
                Text(
                  'Hobbies: ...', // Replace with user's hobbies
                ),
                SizedBox(height: 8.0),
                Text(
                  'Contact Information: ...', // Replace with user's contact info
                ),
              ],
            ),
          ),
          // History dropdown with text box
          Container(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                DropdownButton<String>(
                  items: selectedhistorys.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    // 处理下拉菜单选择
                    if (newValue != null) {
                      // 更新右侧文本框内容
                      setState(() {
                        selectedHistoryText = newValue;
                      });
                      textController.text = selectedHistoryText;
                    }
                  },
                  hint: Text('Select HistoryId'),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: TextFormField(
                    controller: textController,
                    decoration: InputDecoration(
                      labelText: 'History Text',
                      border: OutlineInputBorder(),
                    ),
                    readOnly: true,
                    maxLines: 5, // 设置文本框最大行数为5
                  ),
                ),

              ],
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
            Navigator.pop(context); // Home button pressed
          } else if (index == 1) {
            Navigator.pushNamed(context, '/add'); // Add button pressed
          } else if (index == 2) {
            // Profile button pressed
            // Navigator.pushNamed(context, '/profile');
          }
        },
      ),
    );
  }
}
