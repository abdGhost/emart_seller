import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/const/firebase_consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  // Login Method
  Future<UserCredential?> loginMethod({context}) async {
    UserCredential? userCredential;
    try {
      userCredential = await firebaseAuth.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } on FirebaseAuthException catch (error) {
      VxToast.show(context, msg: error.toString());
    }
    return userCredential;
  }

  // Signup Method
  signupMethod({email, password, context}) async {
    UserCredential? userCredential;
    try {
      userCredential = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (error) {
      VxToast.show(context, msg: error.toString());
    }
    return userCredential;
  }

  // Signout Method
  signOutMethod({context}) async {
    try {
      await firebaseAuth.signOut();
    } catch (error) {
      VxToast.show(context, msg: error.toString());
    }
  }
}
