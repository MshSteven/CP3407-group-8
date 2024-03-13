import 'package:flutter/material.dart';
import 'tutor_list.dart';


class _tutor_cell extends StatelessWidget {
  _tutor_cell({this.imageUrl,this.name,this.groupTitle});
  final String? imageUrl;
  final String? name;
  final String? groupTitle;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}



class FirstRoute extends StatelessWidget {
  Widget? _itemForRow(BuildContext context, int index) {
    return _tutor_cell()；  //待办
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Column(
        children: <Widget>[
          SearchBarWidget(),
          Container(
            child: ListView.builder(itemBuilder: _itemForRow,itemCount: datas.length,),
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
                EdgeInsets.symmetric(horizontal: 16.0)),
            onTap: () {
              controller.openView();
            },
            onChanged: (_) {
              controller.openView();
            },
            leading: const Icon(Icons.search),
          );
        }, suggestionsBuilder:
        (BuildContext context, SearchController controller) {
      return List<ListTile>.generate(5, (int index) {
        final String item = 'item $index';
        return ListTile(
          title: Text(item),
          onTap: () {
            setState(() {
              selectedItem = item;
              controller.closeView(item);
            });
          },
        );
      });
    }
    );
  }
}

// class tutor_data extends  //待办
