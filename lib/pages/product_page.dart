import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/pages/cart_screen.dart';
import 'package:shopping_app/widget/drawer.dart';
import 'package:shopping_app/widget/layout.dart';

import '../provider/product_provider.dart';
import '../widget/productlist.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context);
    final product = provider.product;
    final mylist = provider.mylist;
    final width = MediaQuery.of(context).size.width.toDouble();
    final height = MediaQuery.of(context).size.height.toDouble();
    return Scaffold(
      drawer: SideBar(),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blueGrey.shade900,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CartScreen()));
        },
        label: Text(
          mylist.length.toString(),
        ),
        icon: const Icon(Icons.shopping_cart),
      ),
      body: LayoutPage(
        title: 'Shopping App',
        content: GridView.builder(
          itemCount: product.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 5.0,
            childAspectRatio: width / height,
          ),
          itemBuilder: ((context, index) {
            final currentproduct = product[index];
            return ProductList(
                height: height,
                width: width,
                currentproduct: currentproduct,
                mylist: mylist,
                provider: provider);
          }),
        ),
      ),
    );
  }
}
