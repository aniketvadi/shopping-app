import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/widget/drawer.dart';

import '../widget/layout.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideBar(),
      body: LayoutPage(
        title: 'Profile',
        content: Column(
          children: [
            Text(
              'Name: ${user!.displayName}',
              style: const TextStyle(fontSize: 19, color: Colors.black),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Email: ${user!.email}',
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
