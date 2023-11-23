import 'package:emart_seller/const/firebase_consts.dart';

class FirestoreServices {
  static getProfileData(uid) {
    return firebaseFirestore
        .collection(vendorsCollection)
        .where(
          'id',
          isEqualTo: uid,
        )
        .get();
  }

  static getMessagesData({uid}) {
    return firebaseFirestore
        .collection(chatsCollection)
        .where('to_id', isEqualTo: uid)
        .snapshots();
  }

  static getOrders(uid) {
    return firebaseFirestore
        .collection('orders')
        .where('vendors', arrayContains: uid)
        .snapshots();
  }

  static getProducts(uid) {
    print(uid);
    return firebaseFirestore
        .collection('products')
        .where('vendor_id', isEqualTo: uid)
        .snapshots();
  }
}
