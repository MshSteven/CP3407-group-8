import 'package:flutter/material.dart';
import 'tutor_list.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// class TutorDetailPage extends StatelessWidget {
//   final int tutorId;
//
//   TutorDetailPage({required this.tutorId});
//
//   @override
//   Widget build(BuildContext context) {
//     // 在这里实现详情页面的UI
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Tutor Detail'),
//       ),
//       body: Center(
//         child: Text('Tutor ID: $tutorId'),
//       ),
//     );
//   }
// }

class TutorListView extends StatefulWidget {


  @override
  _TutorListViewState createState() => _TutorListViewState();
}

class _TutorListViewState extends State<TutorListView> {
  late List<tutor_data> _sortedData;

  @override
  void initState() {
    super.initState();
    _sortedData = datas..sort((a, b) => a.indexLetter.compareTo(b.indexLetter));
  }

  void _navigateToDetailPage(BuildContext context, int tutorId, String tutorName, String tutorImageUrl) {
    final arguments = {
      'tutorId': tutorId,
      'tutorName': tutorName,
      'tutorImageUrl': tutorImageUrl,
    };
    Navigator.pushNamed(
      context,
      '/detail',
      arguments: arguments,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _sortedData.length,
      itemBuilder: (context, index) {
        final tutorData = _sortedData[index];
        return GestureDetector(
            onTap: () => _navigateToDetailPage(
              context, // 将BuildContext传递给方法
              tutorData.id,
              tutorData.name,
              tutorData.imageUrl,
            ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (index == 0 || _sortedData[index].indexLetter != _sortedData[index - 1].indexLetter)
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 8.0),
                  child: Text(
                    tutorData.indexLetter,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      width: 40,
                      height: 34,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0),
                        image: DecorationImage(
                          image: NetworkImage(tutorData.imageUrl),
                        ),
                      ),
                    ),
                    Text(
                      tutorData.name,
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class FirstRoute extends StatelessWidget {
  // final Database database; // 添加一个名为database的参数

  // FirstRoute({required this.database}); // 构造函数中初始化database参数

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Column(
        children: <Widget>[
          SearchBarWidget(),
          Expanded(
            child: TutorListView(),
          )
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
            // You can optionally add code here to navigate to the home route
          } else if (index == 1) {
            // Add button pressed
            Navigator.pushNamed(context, '/add');
          } else if (index == 2) {
            // Profile button pressed
            Navigator.pushNamed(context, '/profile');
          }
        },
      ),
    );
  }
}

class SearchBarWidget extends StatefulWidget {
  @override
  _SearchBarWidgetState createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  String selectedItem = '';

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      builder: (BuildContext context, SearchController controller) {
        return SearchBar(
          controller: controller,
          padding: const MaterialStatePropertyAll<EdgeInsets>(
            EdgeInsets.symmetric(horizontal: 16.0),
          ),
          onTap: () {
            controller.openView();
          },
          onChanged: (_) {
            controller.openView();
          },
          leading: const Icon(Icons.search),
        );
      },
      suggestionsBuilder: (BuildContext context, SearchController controller) {
        List<tutor_data> suggestions = datas.where((tutorData) {
          String name = tutorData.name.toLowerCase();
          String input = controller.value.text.toLowerCase();
          return name.contains(input);
        }).toList();

        return List<ListTile>.generate(suggestions.length, (int index) {
          final tutor_data tutorData = suggestions[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(tutorData.imageUrl),
            ),
            title: Text(tutorData.name),
            onTap: () {
              setState(() {
                selectedItem = tutorData.name;
                controller.closeView(tutorData.name);
              });
            },
          );
        });
      },
    );
  }
}