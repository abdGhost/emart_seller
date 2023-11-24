import 'package:emart_seller/const/firebase_consts.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getUsername();
  }

  var navbarIndex = 0.obs;
  var username = ''.obs;

  getUsername() async {
    var n = await firebaseFirestore
        .collection(vendorsCollection)
        .where('id', isEqualTo: currentUser!.uid)
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        return value.docs.single['vendorName'];
      }
    });
    username = n;
  }
}
