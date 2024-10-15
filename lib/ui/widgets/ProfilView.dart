import 'package:flutter/material.dart';
import 'package:lib/models/User.dart';

class ProfileScreen extends StatelessWidget {
  final User user;

  ProfileScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Profil von ${user.name}')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${user.name}', style: TextStyle(fontSize: 20)),
            SizedBox(height: 10),
            Text('Skills: ${user.skills}'),
            SizedBox(height: 10),
            Text('Bio: ${user.bio}'),
          ],
        ),
      ),
    );
  }
}
