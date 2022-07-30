import 'package:flutter/material.dart';

import '../modal/product_item.dart';
import '../provider/product_provider.dart';
class ProductList extends StatelessWidget {
  const ProductList({
    Key? key,
    required this.height,
    required this.width,
    required this.currentproduct,
    required this.mylist,
    required this.provider,
  }) : super(key: key);

  final double height;
  final double width;
  final Product currentproduct;
  final List<Product> mylist;
  final ProductProvider provider;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 1.0,
      width: width * 1.0,
      child: Stack(
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: height * 0.28,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image(
                      image: NetworkImage(currentproduct.image),
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    currentproduct.title,
                    maxLines: 1,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(children: [
                    const Text(
                      'Rate : ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Expanded(
                      child: Text(
                        '${currentproduct.rating.rate} (${currentproduct.rating.rate})',
                        style: const TextStyle(
                            color:
                                 Color.fromARGB(255, 243, 135, 3)),
                      ),
                    ),
                  ]),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    '${currentproduct.price}' r' $',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: height * 0.27,
            right: 2,
            child: IconButton(
                onPressed: () {
                  if (!mylist.contains(currentproduct)) {
                    provider.addToList(currentproduct);
                  } else {
                    provider.removeFromList(currentproduct);
                  }
                },
                icon: CircleAvatar(
                  backgroundColor: Colors.blueGrey.shade900,
                  radius: 35,
                  child: Icon(
                    mylist.contains(currentproduct)
                        ? Icons.done_all
                        : Icons.shopping_cart_outlined,
                    color:  Colors.white,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}