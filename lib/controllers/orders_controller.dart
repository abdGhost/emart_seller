import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_seller/const/firebase_consts.dart';
import 'package:get/get.dart';

class OrdersController extends GetxController {
  var orders = [];

  var confirmed = false.obs;
  var onDelivery = false.obs;
  var delivered = false.obs;

  getOrders(data) {
    for (var item in data['orders']) {
      if (item['vendor_id'] == currentUser!.uid) {
        orders.add(item);
      }
    }
  }

  changeStatus({titile, status, docId}) async {
    var store = firebaseFirestore.collection(orderCollection).doc(docId);
    await store.set({
      titile: status,
    }, SetOptions(merge: true));
  }
}
