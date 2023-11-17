import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth firebaseAuth = FirebaseAuth.instance;
FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

User? currentUser = firebaseAuth.currentUser;

const vendorsCollection = "vendors";

const productCollection = "products";

const chatsCollection = "chats";

const messageCollection = "messages";

const orderCollection = "order";
