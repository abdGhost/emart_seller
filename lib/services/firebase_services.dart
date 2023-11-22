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
}
