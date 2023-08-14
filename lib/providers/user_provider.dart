import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../auth.dart';
import '../models/user_model.dart';

class UserProvider with ChangeNotifier {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  UserModel userProviderData = UserModel(
    id: '', // Initialize with the desired value
    name: '', // Initialize with the desired value
    userName: '', // Initialize with the desired value
    email: '', // Initialize with the desired value
    gender: '', // Initialize with the desired value
    age: '', // Initialize with the desired value
    userProfileUrl: null, // Initialize with the desired value
    userBackgroundUrl: null, // Initialize with the desired value
  );

  Future<void> setUserName(String userName) async {
    await _firebaseFirestore
        .collection('user')
        .doc(Auth().currentUser!.uid)
        .update({"userName": userName});
    print('Done userName');
  }

  Future<void> setName(String name) async {
    await _firebaseFirestore
        .collection('user')
        .doc(Auth().currentUser!.uid)
        .update({"name": name});
    print('Done name');
  }

  Future<void> setAge(String age) async {
    await _firebaseFirestore
        .collection('user')
        .doc(Auth().currentUser!.uid)
        .update({"age": age});
    print('Done age');
  }

  Future<void> setGender(String gender) async {
    await _firebaseFirestore
        .collection('user')
        .doc(Auth().currentUser!.uid)
        .update({"gender": gender});
    print('Done gender');
  }

  Future<void> setUserProfileUrl(String userProfileUrl) async {
    await _firebaseFirestore
        .collection('user')
        .doc(Auth().currentUser!.uid)
        .update({"userProfileUrl": userProfileUrl});
    print('Done user profile');
  }

  Future<void> setUserBackgroundUrl(String userBackgroundUrl) async {
    await _firebaseFirestore
        .collection('user')
        .doc(Auth().currentUser!.uid)
        .update({"userBackgroundUrl": userBackgroundUrl});
    print('Done user background');
  }

  Future<void> fetchUserData() async {
    await _firebaseFirestore
        .collection('user')
        .doc(Auth().currentUser!.uid)
        .get()
        .then(
      (snapshot) {
        userProviderData.id = snapshot.data()!['id'];
        userProviderData.name = snapshot.data()!['name'];
        userProviderData.email = snapshot.data()!['email'];
        userProviderData.userName = snapshot.data()!['userName'];
        userProviderData.age = snapshot.data()!['age'];
        userProviderData.gender = snapshot.data()!['gender'];
        userProviderData.userProfileUrl = snapshot.data()!['userProfileUrl'];
        userProviderData.userBackgroundUrl =
            snapshot.data()!['userBackgroundUrl'];
      },
    );
  }
}
