import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/pages/product_page.dart';
import 'package:shopping_app/provider/product_provider.dart';
import 'package:shopping_app/widget/drawer.dart';
import 'package:shopping_app/widget/layout.dart';
import 'package:shopping_app/widget/productlist.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context);
    final cartitem = provider.mylist;
    final product = provider.product;
    final width = MediaQuery.of(context).size.width.toDouble();
    final height = MediaQuery.of(context).size.height.toDouble();

    return SafeArea(
      child: Scaffold(
        drawer: SideBar(),
        body: cartitem.isEmpty
            ? LayoutPage(
                title: 'Cart',
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Cart is Empty'),
                    SizedBox(height: 15,),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blueGrey.shade900,
                        onPrimary: Colors.white
                      ),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ProductScreen()));
                      },
                      child: Text(
                        'Shop Now',
                        style: TextStyle(fontSize: 19),
                      ),
                    ),
                  ],
                ))
            : LayoutPage(
                title: 'Cart',
                content: GridView.builder(
                  itemCount: cartitem.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 5.0,
                    childAspectRatio: width / height,
                  ),
                  itemBuilder: ((context, index) {
                    final currentproduct = cartitem[index];
                    return ProductList(
                        height: height,
                        width: width,
                        currentproduct: currentproduct,
                        mylist: cartitem,
                        provider: provider);
                  }),
                ),
              ),
        bottomNavigationBar: Container(
          color: Colors.blueGrey.shade900,
          padding: const EdgeInsets.all(10),
          height: 50,
          child: Row(children: [
            const Text(
              'Total Price : ',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Colors.white),
            ),
            Text(
              provider.totalprice.toString() + r' $',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold,color: Colors.white),
            )
          ]),
        ),
      ),
    );
  }
}
