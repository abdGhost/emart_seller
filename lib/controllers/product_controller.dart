import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/controllers/home_controller.dart';
import 'package:emart_seller/models/category_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

import '../const/firebase_consts.dart';

class ProductController extends GetxController {
  var isloading = false.obs;
  var pnameController = TextEditingController();
  var pdescController = TextEditingController();
  var ppriceController = TextEditingController();
  var pquantityController = TextEditingController();

  var categoryList = <String>[].obs;
  var subCategoryList = <String>[].obs;
  List<Category> category = [];
  var pImagesLinks = [];
  var pimagesList = RxList<dynamic>.generate(3, (index) => null);

  var categoryValue = ''.obs;
  var subCategoryValue = ''.obs;
  var selectedColorIndex = 0.obs;

  getCategory() async {
    var data = await rootBundle.loadString('lib/services/category_model.json');
    var cat = categoryModelFromJson(data);
    category = cat.categories;
  }

  populateCategoryList() {
    categoryList.clear();

    for (var item in category) {
      categoryList.add(item.name);
    }
  }

  populateSubCategory(cat) {
    subCategoryList.clear();
    var data = category.where((element) => element.name == cat).toList();
    for (var i = 0; i < data.first.subcategory.length; i++) {
      subCategoryList.add(data.first.subcategory[i]);
      print(i);
    }
  }

  pickImage(index, context) async {
    try {
      final img = await ImagePicker().pickImage(source: ImageSource.camera);
      if (img == null) {
        return;
      } else {
        pimagesList[index] = File(img.path);
      }
    } catch (e) {
      VxToast.show(context, msg: 'Error');
    }
  }

  uploadProudctImages() async {
    for (var item in pimagesList) {
      if (item != null) {
        var filename = basename(item.path);
        var destination = 'images/vendor/${currentUser!.uid}/$filename';
        Reference ref = FirebaseStorage.instance.ref().child(destination);
        await ref.putFile(item);
        var n = await ref.getDownloadURL();
        pImagesLinks.add(n);
      }
    }
  }

  uploadProduct(context) {
    var store = firebaseFirestore.collection(productCollection).doc();
    store.set(
      {
        'is_featured': false,
        'p_category': categoryValue,
        'p_color': FieldValue.arrayUnion(
            [Color(Colors.red.value), Color(Colors.green.value)]),
        'p_description': pdescController.text,
        'p_images': FieldValue.arrayUnion(pImagesLinks),
        'p_name': pnameController.text,
        'p_price': ppriceController.text,
        'p_quantity': pquantityController.text,
        'p_rating': 5.0,
        'p_wishlist': [],
        'vendor_id': currentUser!.uid,
        'p_seller': Get.find<HomeController>().username,
        'featured_id': '',
      },
      SetOptions(merge: true),
    );
    isloading(false);
    VxToast.show(context, msg: "Product Uploaded");
  }
}
