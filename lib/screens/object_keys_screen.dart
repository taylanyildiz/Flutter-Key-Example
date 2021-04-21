import 'dart:math';

import 'package:flutter/material.dart';
import 'package:transiton_screens/model/user_model.dart';
import 'package:transiton_screens/widgets/widgets.dart';

class ObjectKeysScreen extends StatefulWidget {
  final String title;

  const ObjectKeysScreen({
    Key key,
    this.title,
  }) : super(key: key);
  @override
  _ObjectKeysScreenState createState() => _ObjectKeysScreenState();
}

class _ObjectKeysScreenState extends State<ObjectKeysScreen> {
  List<User> users;
  void clickButton() {
    final random = Random();
    setState(() {
      int index = random.nextInt(users.length - 1);
      final user = users.removeAt(index);
      users.insert(index + 1, user);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    users = [
      User(
        name: 'Taylan',
        country: 'Turkey',
      ),
      User(
        name: 'YILDIZ',
        country: 'FRANCE',
      ),
      User(
        name: 'Jhona',
        country: 'England',
      ),
      User(
        name: 'Ahmad',
        country: 'India',
      ),
    ];
  }

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
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: users
            .map((user) => CustomContainer(
                  key: ObjectKey(user),

                  /// key: ValueKey(user),
                  ///  it works but if 2 object same hashcode value,it doesn't work in this time so we need [ObjectKey]
                  user: user,
                ))
            .toList(),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => clickButton(),
        child: Icon(Icons.swap_horiz),
      ),
    );
  }
}
