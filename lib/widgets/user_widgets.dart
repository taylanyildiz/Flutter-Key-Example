import 'dart:math';

import 'package:flutter/material.dart';
import 'package:transiton_screens/model/user_model.dart';

class UserWidgets extends StatefulWidget {
  final User user;

  const UserWidgets({
    Key key,
    this.user,
  }) : super(key: key);

  @override
  _UserWidgetsState createState() => _UserWidgetsState();
}

class _UserWidgetsState extends State<UserWidgets> {
  var color;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    color = generateColor();
  }

  Color generateColor() {
    final random = Random();
    return Color.fromARGB(
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: ListTile(
        tileColor: color,
        title: Text(
          widget.user.name,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
          ),
        ),
        leading: Icon(Icons.person),
        subtitle: Text(
          widget.user.country,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.0,
          ),
        ),
        trailing: Text('${widget.user.hashCode}'),
      ),
    );
  }
}
