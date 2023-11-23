import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/models/category_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var pnameController = TextEditingController();
  var pdescController = TextEditingController();
  var ppriceController = TextEditingController();
  var pquantityController = TextEditingController();

  var categoryList = <String>[].obs;
  var subCategoryList = <String>[].obs;
  List<Category> category = [];
  var pimagesList = [].obs;

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
}
