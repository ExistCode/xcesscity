import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:xcesscity/models/user_model.dart';
import 'package:xcesscity/providers/user_provider.dart';

class StorageRepository extends UserProvider {
  final FirebaseStorage storage = FirebaseStorage.instance;

  Future<void> uploadImage(UserModel user, XFile image) async {
    try {
      await storage
          .ref('${user.id}/${user.userProfileUrl}')
          .putFile(File(image.path))
          .then(
            (p0) => UserProvider().updateUserPictures(
              user,
              image.name,
            ),
          );
    } catch (e) {
      print(e);
    }
  }

  Future<String> getDownloadUrl(UserModel user, String imageName) async {
    String downloadUrl =
        await storage.ref('${user.id}/$imageName').getDownloadURL();

    return downloadUrl;
  }
}
