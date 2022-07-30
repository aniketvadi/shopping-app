import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopping_app/pages/cart_screen.dart';
import 'package:shopping_app/pages/product_page.dart';
import 'package:shopping_app/pages/profile_page.dart';

class SideBar extends StatelessWidget {
  SideBar({Key? key}) : super(key: key);

  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.blueGrey,
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
              title: const Text(
                'Profile',
                style: TextStyle(color: Colors.white),
              ),
              leading: const FaIcon(
                FontAwesomeIcons.user,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfilePage()));
              },
            ),
            ListTile(
              title: const Text(
                'Shop',
                style: TextStyle(color: Colors.white),
              ),
              leading: const FaIcon(
                FontAwesomeIcons.shop,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProductScreen()));
              },
            ),
            ListTile(
              title: const Text(
                'Cart',
                style: TextStyle(color: Colors.white),
              ),
              leading: const FaIcon(
                FontAwesomeIcons.shoppingBag,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartScreen()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
