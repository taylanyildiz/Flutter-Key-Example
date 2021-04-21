import 'package:flutter/material.dart';

class ListViewWidget extends StatelessWidget {
  ListViewWidget({
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
