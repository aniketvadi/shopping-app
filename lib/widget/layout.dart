import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../modal/product_item.dart';
import '../provider/product_provider.dart';
import '../services/getapidata.dart';

class LayoutPage extends StatefulWidget {
  Widget content;
  String title;
  LayoutPage({required this.content, required this.title});

  @override
  State<LayoutPage> createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 107),
            child: Container(
              padding: const EdgeInsets.only(top: 17,right: 10,left: 10,),
              width: MediaQuery.of(context).size.width.toDouble() * 1.0,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25)),
              ),
              child: widget.content,
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            height: 120,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color.fromARGB(255, 41, 80, 99), Color.fromARGB(255, 37, 72, 120)],
              ),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: IconButton(
                          onPressed: () => Scaffold.of(context).openDrawer(),
                          icon: const FaIcon(
                            FontAwesomeIcons.bars,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            onPressed: () {
                              final provider =
                                  Provider.of<ProductProvider>(context);
                              provider.Logout();
                            },
                            icon: Icon(
                              Icons.logout,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Expanded(
                      child: Text(
                    widget.title,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.white),
                  ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
