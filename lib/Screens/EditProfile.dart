import 'package:flutter/material.dart';

import '../UserPreferences.dart';
import '../Widgets/Profile_widget.dart';
import '../Widgets/TextField_widget.dart';



class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final user = UserPreferences.myUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              }),
          elevation: 0,
          title: Text('Edit Profile Page'),
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 32),
          physics: BouncingScrollPhysics(),
          children: [
            Profile_widget(imagePath: user.imagePath, onClicked: () async {}),
            const SizedBox(
              height: 20,
            ),
            TextField_widget(
              label: 'Full Name',
              text: user.userName,
              onChanged: (username) {},
            ),
            const SizedBox(
              height: 20,
            ),
            TextField_widget(
              label: 'Email',
              text: user.email,
              onChanged: (email) {},
            ),
            const SizedBox(
              height: 20,
            ),
            TextField_widget(
              label: 'About',
              text: user.about,
              onChanged: (about) {},
            ),
          ],
        ));
  }
}
