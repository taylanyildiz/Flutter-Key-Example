import 'package:flutter/material.dart';
import 'package:transiton_screens/utils.dart';

class ValueKeysScreen extends StatefulWidget {
  final String title;

  const ValueKeysScreen({
    Key key,
    @required this.title,
  }) : super(key: key);
  @override
  _ValueKeysScreenState createState() => _ValueKeysScreenState();
}

class _ValueKeysScreenState extends State<ValueKeysScreen> {
  bool isMail = true;
  void removeClick() {
    setState(() {
      isMail = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: Utils.child(
              height: 16.0,
              children: [
                if (isMail)
                  TextField(
                    key: ValueKey(1),
                    decoration: InputDecoration(
                      labelText: 'E-mail',
                      border: OutlineInputBorder(),
                    ),
                  ),
                TextField(
                  key: ValueKey(2),
                  decoration: InputDecoration(
                    labelText: 'User Name',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => removeClick(),
          label: Text('Remove mail'),
          icon: Icon(Icons.remove),
        ),
      ),
    );
  }
}
