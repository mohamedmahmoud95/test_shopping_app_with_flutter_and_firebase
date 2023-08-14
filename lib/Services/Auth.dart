//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import 'AppUser.dart';
//
// class Auth {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   //create user obj based on firebase user
//   // AppUser? _userFromFirebase(UserCredential user) {
//   //   return user != null ? AppUser(uid: ) : null;
//   // }
//
//   AppUser? _userFromFirebase(User? user) {
//     if (user != null) {
//       debugPrint("userFromFirebase created");
//       return AppUser(uid: user.uid);
//     }
//     return null;
//   }
//
//
//
//   //auth change user stream
//   // Stream<AppUser?> get user {
//   //   {
//   //     return _auth.authStateChanges.map(
//   //         (User user) => _userFromFirebase(user as UserCredential)); //map to our user
//   //     //.map(_userFromFirebase(user));
//   //   }
//   // }
//
//   Stream<AppUser?> get user {
//     return _auth.authStateChanges().map((user) {
//       if (user == null) {
//         return null;
//       } else {
//         return _userFromFirebase(user);
//       }
//     });
//   }
//
//
//
//
//   Future register(String email, String password) async {
//     try {
//       UserCredential authResult = await _auth.createUserWithEmailAndPassword(
//           email: email, password: password);
//       User? user = authResult.user; //grab user from the result
//       return _userFromFirebase(user);
//     } catch (e) {
//       print(e.toString());
//       return null; //if it fails can't register with email and pass
//     }
//   }
//
//   Future SignInwithEmail(String email, String password) async {
//     try {
//       UserCredential authResult = await _auth.signInWithEmailAndPassword(
//           email: email, password: password);
//       User? user = authResult.user; //grab user from the result
//       return _userFromFirebase(user );
//     } catch (e) {
//       print(e.toString());
//       return null; //if it fails can't register with email and pass
//     }
//   }
//
//   Future signInAnom() async {
//     try {
//       UserCredential authResult = await _auth.signInAnonymously();
//       debugPrint("authenticated");
//       User? user = authResult.user;
//       debugPrint("got the user id");
//
//       return _userFromFirebase(user);
//     } catch (e) {
//       print(e.toString());
//       debugPrint("could not signInAnon");
//       return null; //if it fails
//     }
//   }
//
//   Future signOut() async {
//     try {
//       return await _auth.signOut();
//     } catch (e) {
//       print(e.toString());
//       return null;
//     }
//   }
// }


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'AppUser.dart';

class AuthServices {
  //an instance of the FirebaseAuth class
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Function to create a custom user from firebase user
  AppUser? _createAppUserFromFirebaseUser(User? user) {
    if (user != null) {
      debugPrint("created a userFromFirebase");

      return AppUser(uid: user.uid);
    }
    else {
      debugPrint("couldn't create a userFromFirebase");

      return null;
    }
  }

  //Auth change user stream (to keep track of any change in authentication)
  Stream<AppUser?> get userStream {
    debugPrint("auth state changed");
    return _auth.authStateChanges().map(_createAppUserFromFirebaseUser);
  }

  //anonymous sign in
  Future signInAnon() async {
    try {
      UserCredential authResult = await _auth.signInAnonymously();
      final User? firebaseUser = authResult.user;
      debugPrint("Hello from signInAnon in auth services");
      return _createAppUserFromFirebaseUser(firebaseUser!);
    } catch (e) {
      debugPrint("$e");
      return null;
    }
  }

  //Sign up with email and password
  Future signUp(String email, String password) async {
    try {
      UserCredential authResult = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      final User? firebaseUser = authResult.user;

      debugPrint("New user added to firebase!");

      //Create a Firestore cloud database collection doc with initial data
      debugPrint("Database collection doc created!");
      return _createAppUserFromFirebaseUser(firebaseUser);
    } catch (e) {
      debugPrint("$e");
      return null;
    }
  }


  //Sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential authResult = await _auth.signInWithEmailAndPassword(email: email, password: password);
      final User? firebaseUser = authResult.user;

      return _createAppUserFromFirebaseUser(firebaseUser!);
    } catch (e) {
      debugPrint("$e");
      return null;
    }
  }


  //sign out
  Future signOut() async {
    try {
      await _auth.signOut();
      return null;
    } catch (e) {
      debugPrint("$e");
      return e;
    }
  }
}
