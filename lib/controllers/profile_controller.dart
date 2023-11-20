import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/const/firebase_consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class ProfileController extends GetxController {
  QueryDocumentSnapshot? snapshot;
  var profileImagePath = "".obs;

  var profileImageLink = "".obs;

  var isLoading = false.obs;

  var nameController = TextEditingController();
  var oldPasswordController = TextEditingController();
  var newPasswordController = TextEditingController();

  // Change Profile Image using camera
  changeProfileImage({context}) async {
    try {
      var image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;

      profileImagePath.value = image.path;
    } on PlatformException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }

  //Upload Profile Image to firebase
  uploadProfileImage() async {
    var filename = basename(profileImagePath.value);
    var destination = 'images/${currentUser!.uid}/$filename';
    Reference ref = FirebaseStorage.instance.ref().child(destination);
    await ref.putFile(File(profileImagePath.value));
    profileImageLink.value = await ref.getDownloadURL();
  }

  //Update Profile data
  updateProfileData({email, password, name}) async {
    var store =
        firebaseFirestore.collection(vendorsCollection).doc(currentUser!.uid);
    await store.set({"email": email, "password": password, "name": name},
        SetOptions(merge: true));
    isLoading(false);
  }

  //Change Password
  changeAuthPassword({email, password, newPassword, context}) async {
    final credential =
        EmailAuthProvider.credential(email: email, password: password);

    await currentUser!.reauthenticateWithCredential(credential).then((value) {
      currentUser!.updatePassword(newPassword);
    }).catchError((e) {
      VxToast.show(context, msg: e.toString());
    });
  }
}
