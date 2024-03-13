// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'tutor_list.dart';


  class _tutor_cell extends StatelessWidget {
    _tutor_cell({ required this.imageUrl,
      required this.name,
      required this.groupTitle,
    required this.imageAsset});
    final String imageUrl;
    final String name;
    final String groupTitle;
    final String imageAsset;

    @override
    Widget build(BuildContext context) {
      return Container(
        color: Colors.white,
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              width: 40,
              height: 34,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                image: DecorationImage(
                  image: AssetImage('assets/images/OIP.jpg')//待办
                )


              ),
            ), //pic
            Container(
              child: Text(
                name,
                style: TextStyle(fontSize: 18),
              ),
            ), //name
          ],
        ),
      );
    }
  }



  class FirstRoute extends StatelessWidget {

    Widget _separatorBuilder(BuildContext context, int index) {
      if (index == 0 || datas[index].indexLetter != datas[index - 1].indexLetter) {
        // Display a separator before a new group
        return ListTile(
          title: Text(datas[index].indexLetter), // Display the group title here
          // Adjust styling as needed
        );
      }
      // No separator needed
      return SizedBox.shrink();
    }

    Widget? _itemForRow(BuildContext context, int index) {
      return _tutor_cell(
        imageUrl: datas[index].imageUrl,
        name: datas[index].name,
        groupTitle: datas[index].indexLetter,
        imageAsset: 'assets/images/OIP.jpg',
      );

    }


    @override
    Widget build(BuildContext context) {
      datas.sort((a, b) => a.indexLetter.compareTo(b.indexLetter));
      return Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
        ),
        body: Column(
          children: <Widget>[
            SearchBarWidget(),
            Expanded(
              child: ListView.separated(separatorBuilder: _separatorBuilder,itemBuilder: _itemForRow, itemCount: datas.length,),
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
