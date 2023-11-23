import 'package:emart_seller/const/const.dart';

import '../../widgets/custom_textfield_widget.dart';
import '../../widgets/text_styles.dart';
import 'package:get/get.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
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
              20.heightBox,
              // Category Dropdown Button
              InputDecorator(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 15.0),
                  labelText: 'Category',
                  labelStyle: const TextStyle(color: white, fontSize: 16.0),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: white),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: categoryDropdownValue,
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: white,
                    ),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: purpleColor),
                    onChanged: (String? newValue) {
                      setState(() {
                        categoryDropdownValue = newValue!;
                      });
                    },
                    items:
                        category.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(color: purpleColor),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              20.heightBox,
              // Sub-Category Dropdown Button
              InputDecorator(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 15.0),
                  labelText: 'Subcategory',
                  labelStyle: const TextStyle(color: white, fontSize: 16.0),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: white),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: subCategoryDropdownValue,
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: white,
                    ),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: purpleColor),
                    onChanged: (String? newValue) {
                      setState(() {
                        subCategoryDropdownValue = newValue!;
                      });
                    },
                    items: subCategory
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: const TextStyle(color: purpleColor),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              10.heightBox,
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
            ],
          ),
        ),
      ),
    );
  }
}
