import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../Model/user.dart';
import '../Screens/product_info.dart';
import '../shop.dart';

class shop_widget extends StatefulWidget {
  Shop shop;
  final user AppUser;
  shop_widget({
    Key? key,
    required this.shop,
    required this.AppUser,
  }) : super(key: key);
  @override
  State<shop_widget> createState() => _shop_widgetState();
}

class _shop_widgetState extends State<shop_widget> {
  @override
  Widget build(BuildContext context) {
    var rating = 0.0;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>
                (product_info(shop: widget.shop, AppUser: sampleAppUser)),
          ),
        );
      },
      child: Card(
        elevation: 3,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              height: 200,
              width: 135,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Image.network(
                      widget.shop.url,
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(widget.shop.name, style: TextStyle(color: Colors.black)),
                  RatingBarIndicator(
                    rating: widget.shop.rate,
                    itemCount: 5,
                    itemSize: 15.0,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$${widget.shop.price}",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                      InkWell(
                        child: const Icon(
                          Icons.shopping_cart,
                          color: Colors.deepOrange,
                          size: 15,
                        ),
                        onTap: () {
                          widget.AppUser.CartProducts.add(widget.shop);
                        },
                      ),
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
