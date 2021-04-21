import 'package:flutter/material.dart';
import 'package:transiton_screens/screens/screens.dart';

class HomeScreen extends StatelessWidget {
  final String title;

  HomeScreen({
    Key key,
    this.title,
  }) : super(key: key);

  final tile = <String>[
    "PageStorage Keys",
    "Page Stroage Bucket",
    "Object Keys",
    "Value Keys",
    "Unique Keys",
    'Global Keys',
  ];

  final _screens = <Widget>[
    PageStorageKeysScreen(title: 'PageStorageKeys'),
    PageStorageBucketScreen(title: 'PageStorageBucket'),
    ObjectKeysScreen(title: 'Object Keys'),
    ValueKeysScreen(title: 'Value Keys'),
    UniqueKeysScreen(title: 'Unique Keys'),
    GlobalKeysScreen(title: 'Global Keys'),
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
        body: Container(
          alignment: Alignment.center,
          child: Container(
            height: 300.0,
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              itemCount: tile.length,
              itemBuilder: (context, index) =>
                  _displayButtonWidget(context, index),
            ),
          ),
        ),
      );
}
