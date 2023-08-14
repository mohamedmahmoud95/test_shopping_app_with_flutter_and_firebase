import 'package:flutter/material.dart';

import '../Model/user.dart';
import 'FavScreen.dart';


class FavScreenUI extends StatefulWidget {
  final user AppUser;

  const FavScreenUI({
    Key? key,
    required this.AppUser,
  }) : super(key: key);

  @override
  State<FavScreenUI> createState() => _FavScreenUIState();
}

class _FavScreenUIState extends State<FavScreenUI> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white10,
          leading: BackButton(
            color: Colors.black,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            "My Favorites ",
            style: TextStyle(
                color: Colors.orange.shade900,
                fontSize: 25,
                fontWeight: FontWeight.normal),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: widget.AppUser.FavProducts
                        .map((p) => FavScreen(
                              AppUser: sampleAppUser,
                              shop: p,
                            ))
                        .toList(),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Divider(
                  thickness: 2,
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.fromLTRB(20, 12, 20, 12)),
                  onPressed: () {},
                  child: const Text("checkout",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ))),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
