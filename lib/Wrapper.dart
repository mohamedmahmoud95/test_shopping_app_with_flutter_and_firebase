import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Screens/Home.dart';
import 'Services/AppUser.dart';
import 'authenticate.dart';
import 'main.dart';

class wrapper extends StatelessWidget {
  const wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AppUser>(context);
    if (user == null) {
      debugPrint("in wrapper screen, no user found, navigating to auth");
      return authenticate();
    } else {
      debugPrint("in wrapper screen, user found, navigating to home");
      return Home();
    }
  }
}
