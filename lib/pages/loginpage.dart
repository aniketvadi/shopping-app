import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/provider/product_provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blueGrey.shade900,
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            children: [
              const Spacer(),
              const FlutterLogo(
                size: 120,
              ),
              const Spacer(),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Hi There, \nWelcome here',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Login to Your Account To Continue',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
              ),
              const Spacer(),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.black,
                    minimumSize: const Size(double.infinity, 50)),
                onPressed: () {
                  final provider =
                      Provider.of<ProductProvider>(context, listen: false);
                  provider.googleLogin();
                },
                icon: const FaIcon(
                  FontAwesomeIcons.google,
                  color: Colors.red,
                ),
                label: const Text('Signin With Google'),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
