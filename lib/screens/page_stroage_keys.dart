import 'package:flutter/material.dart';

class PageStorageKeysScreen extends StatefulWidget {
  final String title;
  PageStorageKeysScreen({
    Key key,
    this.title,
  }) : super(key: key);
  @override
  _PageStorageKeysScreenState createState() => _PageStorageKeysScreenState();
}

class _PageStorageKeysScreenState extends State<PageStorageKeysScreen> {
  final _screens = <Widget>[
    LitItemWidget(key: PageStorageKey('listView1')),
    Scaffold(),
    LitItemWidget(key: PageStorageKey('listView2')),
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
        onTap: (page) => setState(() => currentPage = page),
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

class LitItemWidget extends StatelessWidget {
  LitItemWidget({
    Key key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      itemCount: 100,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.symmetric(vertical: 5.0),
        child: ListTile(
          title: Text(
            '$index',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
          tileColor: Colors.red,
          subtitle: Text(
            'List Tile',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
