import 'package:flutter/material.dart';

import '../Model/UserProfile.dart';
import '../UserPreferences.dart';
import '../Widgets/Profile_widget.dart';
import 'EditProfile.dart';

class EditProfileUI extends StatefulWidget {
  const EditProfileUI({Key? key}) : super(key: key);
  @override
  State<EditProfileUI> createState() => _EditProfileUIState();
}

class _EditProfileUIState extends State<EditProfileUI> {
  @override
  Widget build(BuildContext context) {
    final user = UserPreferences.myUser;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            }),
        elevation: 0,
        title: Text('Profile Page'),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Profile_widget(
            imagePath: user.imagePath,
            onClicked: () async {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => EditProfile()));
            },
          ),
          buildName(user),
        ],
      ),
    );
  }

  Widget buildName(UserProfile user) => Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          children: [
            Text(
              user.userName,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              user.email,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              user.phone,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: buildAbout(user),
            ),
          ],
        ),
      );
  Widget buildAbout(UserProfile user) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            user.about,
            style: TextStyle(
              fontSize: 16,
              height: 1.4,
            ),
          ),
        ],
      );
}
