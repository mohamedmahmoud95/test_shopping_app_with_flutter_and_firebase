import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Screens/Home.dart';
import 'Screens/SignIn.dart';
import 'Screens/register.dart';
import 'Services/AppUser.dart';
import 'Services/Auth.dart';
import 'authenticate.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Wrapper.dart';
import 'firebase_options.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    debugPrint("Initialized Firebase connection");
  }
  catch (e) {
    debugPrint(e.toString());
  }

    runApp(
      MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => authenticate(),
          '/home': (context) => wrapper(),
          '/signIn': (context) => SignIn(),
          '/regitser': (context) => register(),
        },
      ),
    );

}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    var rating = 0.0;
    return StreamProvider<AppUser?>.value(
      value: AuthServices().userStream,
      initialData: null,
      child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: wrapper()),

    );
  }

}
