
import 'package:flutter/material.dart';

import 'Screens/SignIn.dart';
import 'Screens/register.dart';


class authenticate extends StatefulWidget {
  const authenticate({Key? key}) : super(key: key);

  @override
  State<authenticate> createState() => _authenticateState();
}

class _authenticateState extends State<authenticate> {
  @override
  Widget build(BuildContext context) {
    //final user = Provider.of<AppUser>(context);
    //print(user);
    return MaterialApp(
      //no3 el app andriod uses this package , cupertino for ios
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: darkBlue,
      ),
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              leading: const BackButton(),
              backgroundColor: Colors.blue,
              title: const Center(child: Text("this is my first app")),

              bottom: const TabBar(



                tabs: [
                  Tab(icon: Icon(Icons.login), text: "sign in"),
                  Tab(icon: Icon(Icons.app_registration), text: "register")
                ],
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_vert),
                  color: Colors.white,
                ),
              ],
            ),
            body: const TabBarView(
              children: [
                SignIn(),
                register(),
              ],
            ),
          )),
    );
  }
}
