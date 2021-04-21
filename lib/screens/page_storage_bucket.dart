import 'package:flutter/material.dart';
import 'package:transiton_screens/widgets/widgets.dart';

/// [globalBucket] must be global
/// Because, should be accessible from all screens
final globalBucket = PageStorageBucket();

/// Preserve Scroll Position [PageStorageBucket]

class PageStorageBucketScreen extends StatelessWidget {
  final String title;

  const PageStorageBucketScreen({
    Key key,
    this.title,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return PageStorage(
      bucket: globalBucket,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: ListViewWidget(
          key: PageStorageKey('list_bucket'),
        ),
      ),
    );
  }
}
