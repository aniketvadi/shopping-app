import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopping_app/pages/profile_page.dart';

class SideBar extends StatelessWidget {
  SideBar({Key? key}) : super(key: key);

  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              child: Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                user!.photoURL!,
              ),
            ),
          )),
          ListTile(
            title: const Text('Profile'),
            leading: const FaIcon(FontAwesomeIcons.user),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfilePage()));
            },
          ),
        ],
      ),
    );
  }
}
