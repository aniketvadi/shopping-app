import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/pages/loginpage.dart';
import 'package:shopping_app/pages/product_page.dart';
import 'package:shopping_app/provider/product_provider.dart';

import '../modal/product_item.dart';
import '../services/getapidata.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  getProduct() async {
    final provider = Provider.of<ProductProvider>(context, listen: false);
    List<Product> product = await RemoteServices().getProductData();
    provider.setProductList(product);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              getProduct();
              return const ProductScreen();
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('something went wrong'),
              );
            } else {
              // return const LoginPage();
              getProduct();
              return const ProductScreen();
            }
          }),
    );
  }
}
