import 'package:flutter/material.dart';
import 'package:transiton_screens/screens/screens.dart';

class HomeScreen extends StatelessWidget {
  final String title;

  HomeScreen({
    Key key,
    this.title,
  }) : super(key: key);

  final tile = <String>[
    "PageStorageKeys",
    "PageStroageBucket",
    "ListView",
    "Grid View",
  ];

  final _screens = <Widget>[
    PageStorageKeysScreen(
      title: 'PageStorageKeys',
    ),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];

  void _showWidget(BuildContext context, int index) => Navigator.push(
      context, MaterialPageRoute(builder: (context) => _screens[index]));

  _displayButtonWidget(context, index) => MaterialButton(
        onPressed: () => _showWidget(context, index),
        child: Text(
          tile[index],
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        color: Colors.red,
        textColor: Colors.white,
      );
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200.0,
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  itemCount: tile.length,
                  itemBuilder: (context, index) =>
                      _displayButtonWidget(context, index),
                ),
              ),
            ],
          ),
        ),
      );
}
