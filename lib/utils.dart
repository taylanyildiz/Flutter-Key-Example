import 'package:flutter/material.dart';

class Utils {
  static List<Widget> child({
    List<Widget> children,
    @required double height,
  }) {
    if (children.isEmpty) return <Widget>[];
    if (children.length == 1) return children;
    final list = [children.first, SizedBox(height: height)];
    for (var i = 1; i < children.length - 1; i++) {
      final child = children[i];
      list.add(child);
      list.add(SizedBox(height: height));
    }
    list.add(children.last);
    return list;
  }
}
