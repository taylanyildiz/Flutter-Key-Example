import 'package:flutter/material.dart';

class GlobalKeysScreen extends StatefulWidget {
  final String title;

  const GlobalKeysScreen({
    Key key,
    @required this.title,
  }) : super(key: key);
  @override
  _GlobalKeysScreenState createState() => _GlobalKeysScreenState();
}

class _GlobalKeysScreenState extends State<GlobalKeysScreen> {
  final counterKeys = GlobalKey<_CounterWidgetState>();

  void clickButton() {
    counterKeys.currentState.increment();
    final count = counterKeys.currentState.count;
    print('$count');
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
          children: [
            CounterWidget(key: counterKeys),
            MaterialButton(
              color: Colors.red,
              textColor: Colors.white,
              onPressed: () => clickButton(),
              child: Text('increment'),
            ),
          ],
        ),
      ),
    );
  }
}

class CounterWidget extends StatefulWidget {
  CounterWidget({Key key}) : super(key: key);
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int count = 0;
  void increment() => setState(() => count++);
  @override
  Widget build(BuildContext context) {
    return Text(
      '$count',
      style: TextStyle(
        color: Colors.black,
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
