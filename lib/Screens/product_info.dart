// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../Model/user.dart';
import '../alert.dart';
import '../main.dart';
import '../shop.dart';

class product_info extends StatefulWidget {
  final Shop shop;
  final user AppUser;

  const product_info({Key? key, required this.shop, required this.AppUser})
      : super(key: key);
  @override
  State<product_info> createState() => _product_infoState();
}

class _product_infoState extends State<product_info> {
  int numInCart = 0;
  bool addedToFavorite = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
            leading: BackButton(
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            backgroundColor: darkBlue,
            elevation: 0,
            title: const Center(
                child: Text("Chosen Product Details",
                    style: TextStyle(color: Colors.white)))),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(children: [
              Center(
                child: SizedBox(
                  height: 200,
                  child: Image.network(widget.shop.url),
                ),
              ),
              const Divider(
                color: Colors.grey,
                thickness: 1,
              ),
              Row(
                children: [
                  Text(
                    "  ${widget.shop.name}",
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    " \$${widget.shop.price}",
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        addedToFavorite = !addedToFavorite;
                        if (addedToFavorite) {
                          setState(() {
                            widget.AppUser.FavProducts.add(widget.shop);
                          });
                        } else {
                          setState(() {
                            widget.AppUser.FavProducts.remove(widget.shop);
                          });
                        }
                      });
                    },
                    child: Icon(
                      addedToFavorite
                          ? Icons.favorite
                          : Icons.favorite_border_outlined,
                      size: 30,
                      color: addedToFavorite ? Colors.red : Colors.grey,
                    ),
                  ),
                ],
              ),
              Container(
                width: 350,
                child: ExpansionTile(
                  title: const Text("Description",
                      style: TextStyle(color: Colors.white, fontSize: 15)),
                  children: [
                    Text(
                      widget.shop.description,
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
              Container(
                width: 350,
                child: ExpansionTile(
                  title: const Text("Return Policy",
                      style: TextStyle(color: Colors.white, fontSize: 15)),
                  children: [
                    Text(
                      widget.shop.policy,
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      if (numInCart > 0) {
                        numInCart--;
                      } else {
                        widget.AppUser.CartProducts.remove(widget.shop);
                      }
                    });
                  },
                  child: const Text(
                    "-",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                Text("$numInCart",
                    style: const TextStyle(color: Colors.white, fontSize: 20)),
                TextButton(
                  onPressed: () {
                    setState(() {
                      numInCart++;
                    });
                  },
                  child: const Text(
                    "+",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                Center(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: const EdgeInsets.fromLTRB(20, 12, 20, 12)),
                      onPressed: () {
                        showAlertDialog(context);
                        setState(() {
                          if (numInCart == 0) {
                            widget.AppUser.CartProducts.remove(widget.shop);
                          } else {
                            widget.AppUser.CartProducts.add(widget.shop);
                          }
                        });
                      },
                      child: const Text(
                        "add to cart",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      )),
                ),
              ]),
            ]),
          ),
        ),
      ),
    );
  }
}
