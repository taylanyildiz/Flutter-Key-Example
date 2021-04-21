import 'dart:math';

import 'package:flutter/material.dart';
import 'package:transiton_screens/model/user_model.dart';

final bucketGlobal = PageStorageBucket();

class HomeScreen extends StatefulWidget {
  final String title;

  const HomeScreen({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final keyCounter = GlobalKey<_DisplayWidgetState>();

  final widgetTitle = <String>["ObjectKey", 'PageStorageKey'];

  _displayView(context, index) {
    if (index == 0)
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => ObjectKeyWidget()));
    if (index == 1)
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => PageStoroageWidget()));
  }

  _listWidget(context, index) => SizedBox(
        width: 200.0,
        child: MaterialButton(
          color: Colors.red,
          textColor: Colors.white,
          child: Text(widgetTitle[index]),
          onPressed: () => _displayView(context, index),
        ),
      );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200.0,
              width: 300.0,
              child: ListView.builder(
                itemCount: widgetTitle.length,
                itemBuilder: (context, index) => _listWidget(context, index),
              ),
            ),
            DisplayWidget(
              key: keyCounter,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => addFunction(),
      ),
    );
  }

  void addFunction() {
    keyCounter.currentState.increment();
    final counter = keyCounter.currentState._counter;
    print(counter);
  }
}

class DisplayWidget extends StatefulWidget {
  DisplayWidget({
    Key key,
  }) : super(key: key);
  @override
  _DisplayWidgetState createState() => _DisplayWidgetState();
}

class _DisplayWidgetState extends State<DisplayWidget> {
  int _counter = 0;
  void increment() => setState(() => _counter++);
  @override
  Widget build(BuildContext context) {
    return Text(
      '$_counter',
      style: TextStyle(
        color: Colors.blue,
        fontSize: 25.0,
      ),
    );
  }
}

class ObjectKeyWidget extends StatefulWidget {
  ObjectKeyWidget({Key key}) : super(key: key);
  @override
  _ObjectKeyWidgetState createState() => _ObjectKeyWidgetState();
}

class _ObjectKeyWidgetState extends State<ObjectKeyWidget> {
  List<User> users;
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
        name: 'Taylan',
        country: 'Turkey',
      ),
      User(
        name: 'Ahmad',
        country: 'India',
      ),
      User(
        name: 'Joeha',
        country: 'France',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Column(
            children: users
                .map((e) => UserWidget(
                      user: e,
                      key: ObjectKey(e),
                    ))
                .toList(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => swapTiles(),
        child: Icon(
          Icons.swap_horiz,
          size: 25.0,
        ),
      ),
    );
  }

  void swapTiles() => setState(() {
        final user = users.removeAt(0);
        users.insert(1, user);
      });
}

class UserWidget extends StatefulWidget {
  final User user;

  const UserWidget({
    Key key,
    @required this.user,
  }) : super(key: key);
  @override
  _UserWidgetState createState() => _UserWidgetState();
}

class _UserWidgetState extends State<UserWidget> {
  Color color;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    color = generateColor();
  }

  Color generateColor() {
    final random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255),
    );
  }

  @override
  Widget build(BuildContext context) => Container(
        color: color,
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
          title: Text(widget.user.name),
          subtitle: Text(widget.user.country),
          trailing: Text('HasCode: ${widget.user.hashCode}'),
        ),
      );
}

class PageStoroageWidget extends StatefulWidget {
  PageStoroageWidget({Key key}) : super(key: key);
  @override
  _PageStoroageWidgetState createState() => _PageStoroageWidgetState();
}

class _PageStoroageWidgetState extends State<PageStoroageWidget> {
  @override
  void initState() {
    super.initState();
    final state =
        PageStorage.of(context).readState(context, identifier: 'grid');
    print(state);
  }

  int pageIndex = 0;
  final _screens = <Widget>[
    ListView.builder(
      key: PageStorageKey<String>('grid'),
      itemCount: 100,
      itemBuilder: (context, index) => Container(
          padding: const EdgeInsets.all(2.0),
          margin: EdgeInsets.symmetric(vertical: 2.0),
          color: Colors.red,
          child: Text(
            '$index View',
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          )),
    ),
    Scaffold(),
  ];
  @override
  Widget build(BuildContext context) {
    return PageStorage(
      bucket: bucketGlobal,
      child: Scaffold(
        appBar: AppBar(),
        body: _screens[pageIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: (page) => setState(() => pageIndex = page),
          currentIndex: pageIndex,
          backgroundColor: Colors.blue,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.red,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '',
            )
          ],
        ),
      ),
    );
  }
}
