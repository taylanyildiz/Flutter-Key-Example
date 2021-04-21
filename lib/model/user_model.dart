import 'package:flutter/cupertino.dart';

class User {
  final String name;
  final String country;

  User({
    @required this.name,
    @required this.country,
  });
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          country == other.country;

  @override
  int get hashCode => name.hashCode ^ country.hashCode;
}
