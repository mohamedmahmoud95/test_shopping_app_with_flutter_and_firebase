import 'package:flutter/material.dart';
import '../Model/user.dart';
import '../Widgets/shop_widget.dart';
import '../shop.dart';
import 'MyCartGUI.dart';

import 'navBar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  List<Shop> shops = [
    product1,
    product2,
    product3,
    product4,
  ];
  @override
  Widget build(BuildContext context) {
    bool addedToFavorite = false;

    return Scaffold(
      drawer: navBar(),
      backgroundColor: Colors.white,
      appBar: AppBar(
          //leading: const BackButton(color: Colors.black),
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Center(
              child:
                  Text("Shopping app", style: TextStyle(color: Colors.black)))),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Wrap(
            //btshof 3rd el screen ya5od kam whda
            spacing: 5,
            runSpacing: 5,
            children: shops
                .map((p) => shop_widget(
                      shop: p,
                      AppUser: sampleAppUser,
                    ))
                .toList(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => MyCartGUI(
              AppUser: sampleAppUser,
            ),
          ));
        },
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.shopping_cart,
          color: Colors.deepOrange,
        ),
      ),
    );
  }
}
