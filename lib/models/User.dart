import 'package:flutter/cupertino.dart';

class User {
  final int id;
  final String name;
  final String lookingFor;
  final String bio;

  User({
    required this.id,
    required this.name,
    required this.lookingFor,
    required this.bio,
  });
}