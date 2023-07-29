import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // User created successfully, now store additional data in Firestore
      await FirebaseFirestore.instance
          .collection('user')
          .doc(userCredential.user!.uid)
          .set({
        "email": userCredential.user!.email,
        "id": userCredential.user!.uid,
        'name': '',
        'userName': '',
        'age': '',
        'gender': '',
        'userProfileUrl': '',
        'userBackgroundUrl': '',
      });
    } catch (e) {
      // Handle any errors that occurred during user creation or data storage
      print("Error creating user: $e");
      // You can also show a relevant error message to the user here
    }
  }

  // Future<void> signOut(BuildContext context) async {
  //   print('logout');
  //   await _firebaseAuth.signOut();
  //   Navigator.of(context).pushReplacementNamed(LoginRegisterScreen.routeName);
  // }

  signInWithGoogle() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
