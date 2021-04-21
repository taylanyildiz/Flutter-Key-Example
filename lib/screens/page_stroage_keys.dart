import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:transiton_screens/widgets/widgets.dart';

class PageStorageKeysScreen extends StatefulWidget {
  final String title;
  final ScrollController controller;
  PageStorageKeysScreen({
    this.controller,
    Key key,
    this.title,
  }) : super(key: key);
  @override
  _PageStorageKeysScreenState createState() => _PageStorageKeysScreenState();
}

class _PageStorageKeysScreenState extends State<PageStorageKeysScreen> {
  final _screens = <Widget>[
    ListViewWidget(key: PageStorageKey('listView1')),
    ListViewWidget(), // Without key
    ListViewWidget(key: PageStorageKey('listView2')),
  ];
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: _screens[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white,
        currentIndex: currentPage,
        onTap: (page) {
          if (page == currentPage) {
            print('same screen');
          }
          setState(() => currentPage = page);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '',
          ),
        ],
      ),
    );
  }
}
