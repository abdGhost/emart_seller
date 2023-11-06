// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/views/auth_screen/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    // firebaseFirestore.collection('test').doc();

    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appname,
      home: LoginScreen(),
    );
  }
}
