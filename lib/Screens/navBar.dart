import 'package:flutter/material.dart';
import '../Model/user.dart';
import '../Services/Auth.dart';
import 'FavScreenUI.dart';
import 'ProfileUI.dart';

class navBar extends StatelessWidget {
  final AuthServices _auth = AuthServices();
  navBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(padding: EdgeInsets.zero, children: [
      UserAccountsDrawerHeader(
        accountName: Text('Shaimaa Mohamed'),
        accountEmail: Text('shimomoh693@gmail.com'),
        currentAccountPicture: CircleAvatar(
          child: ClipOval(
            child: Image.network(
              'https://th.bing.com/th/id/R.fa0ca630a6a3de8e33e03a009e406acd?rik=UOMXfynJ2FEiVw&riu=http%3a%2f%2fwww.clker.com%2fcliparts%2ff%2fa%2f0%2fc%2f1434020125875430376profile.png&ehk=73x7A%2fh2HgYZLT1q7b6vWMXl86IjYeDhub59EZ8hF14%3d&risl=&pid=ImgRaw&r=0',
              //Image(
              //image: AssetImage('shimo_profile.jpeg'),
              width: 90,
              height: 90,
              fit: BoxFit.cover,
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: NetworkImage(
                'https://th.bing.com/th/id/R.f93c3ab2519f98ef81063811bcde9306?rik=fiqS7K74mTR4Ow&riu=http%3a%2f%2fupload.wikimedia.org%2fwikipedia%2fcommons%2f1%2f19%2fFanabe_beach_sunset.jpg&ehk=Iq8UOxiebLTHrAw3InbuBnaDbr%2bjcHvCzhsHaetONB4%3d&risl=1&pid=ImgRaw&r=0'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      ListTile(
        leading: Icon(Icons.favorite),
        title: Text('favorites'),
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => FavScreenUI(
                      AppUser: sampleAppUser,
                    ))),
      ),
      ListTile(
        leading: Icon(Icons.settings),
        title: Text('Settings'),
        onTap: () => null,
      ),
      ListTile(
        leading: Icon(Icons.edit),
        title: Text('Edit Profile'),
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => EditProfileUI())),
      ),
      ListTile(
        leading: Icon(Icons.logout),
        title: Text('Log out'),
        onTap: () async {
          await _auth.signOut();
        },
      ),
    ]));
  }
}
