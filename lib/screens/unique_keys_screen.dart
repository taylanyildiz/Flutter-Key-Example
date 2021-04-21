import 'package:flutter/material.dart';
import 'package:transiton_screens/widgets/widgets.dart';

class UniqueKeysScreen extends StatefulWidget {
  final String title;

  const UniqueKeysScreen({
    Key key,
    @required this.title,
  }) : super(key: key);
  @override
  _UniqueKeysScreenState createState() => _UniqueKeysScreenState();
}

class _UniqueKeysScreenState extends State<UniqueKeysScreen> {
  var children;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    children = [
      Container(key: UniqueKey(), child: CustomContainer(title: '1')),
      Container(key: UniqueKey(), child: CustomContainer(title: '2')),
    ];
  }

  void clickChange() => setState(() {
        final child = children.removeAt(0);
        children.insert(1, child);
      });
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: children,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => clickChange(),
        child: Icon(Icons.swap_horiz),
      ),
    );
  }
}
