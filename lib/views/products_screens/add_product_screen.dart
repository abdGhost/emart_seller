import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/controllers/product_controller.dart';
import 'package:emart_seller/widgets/product_dropdown_widget.dart';

import '../../widgets/custom_textfield_widget.dart';
import '../../widgets/text_styles.dart';
import 'package:get/get.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  var controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    const List<String> category = ['One', 'Two', 'Three', 'Four'];
    const List<String> subCategory = ['One', 'Two', 'Three', 'Four'];

    String categoryDropdownValue = category.first;
    String subCategoryDropdownValue = subCategory.first;

    return Scaffold(
      backgroundColor: purpleColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: white,
          ),
        ),
        title: boldText(text: "Add Product", color: white, size: 16.0),
        actions: [
          TextButton(
            onPressed: () {},
            child: boldText(text: 'Save', color: white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              customTextfieldWidget(
                hint: 'eg. BMW',
                label: 'Product Name',
                isDesc: false,
                controller: null,
              ),
              10.heightBox,
              customTextfieldWidget(
                hint: 'eg. Description about the product',
                label: 'Product Desciption',
                isDesc: true,
                controller: null,
              ),
              10.heightBox,
              customTextfieldWidget(
                hint: 'eg. \$10',
                label: 'Product Price',
                isDesc: false,
                controller: null,
              ),
              10.heightBox,
              customTextfieldWidget(
                hint: 'eg. 5',
                label: 'Product Quantity',
                isDesc: false,
                controller: null,
              ),
              10.heightBox,
              productDropdownWidget(),
              10.heightBox,
              productDropdownWidget(),
              const Divider(
                color: white,
              ),
              10.heightBox,
              Align(
                alignment: Alignment.topLeft,
                child: boldText(text: 'Choose Product Images'),
              ),
              10.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(color: white),
                    child: Center(
                        child: boldText(
                            text: '1', color: purpleColor, size: 24.0)),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(color: white),
                    child: Center(
                        child: boldText(
                            text: '2', color: purpleColor, size: 24.0)),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(color: white),
                    child: Center(
                        child: boldText(
                            text: '3', color: purpleColor, size: 24.0)),
                  ),
                ],
              ),
              4.heightBox,
              Align(
                  alignment: Alignment.topLeft,
                  child: normalText(
                      text: "First images will be display at product")),
              10.heightBox,
              Align(
                alignment: Alignment.topLeft,
                child: boldText(text: 'Choose Product Colors'),
              ),
              10.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: red,
                    ),
                  ),
                  10.widthBox,
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: red,
                    ),
                  ),
                  10.widthBox,
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: red,
                    ),
                  ),
                  10.widthBox,
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: red,
                    ),
                  ),
                  10.widthBox,
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: red,
                    ),
                  ),
                ],
              ),
              10.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: red,
                    ),
                  ),
                  10.widthBox,
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: red,
                    ),
                  ),
                  10.widthBox,
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: red,
                    ),
                  ),
                  10.widthBox,
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: red,
                    ),
                  ),
                  10.widthBox,
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: red,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
