import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/controllers/product_controller.dart';
import 'package:emart_seller/widgets/product_dropdown_widget.dart';
import 'package:emart_seller/widgets/product_image_widget.dart';

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
              productDropdownWidget(
                'Category',
                controller.categoryList,
                controller.categoryValue,
                controller,
              ),
              10.heightBox,
              productDropdownWidget(
                'Sub Category',
                controller.subCategoryList,
                controller.subCategoryValue,
                controller,
              ),
              const Divider(
                color: white,
              ),
              10.heightBox,
              Align(
                alignment: Alignment.topLeft,
                child: boldText(text: 'Choose Product Images'),
              ),
              10.heightBox,
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                      3,
                      (index) => controller.pimagesList[index] != null
                          ? Image.file(
                              controller.pimagesList[index],
                              height: 80,
                              width: 80,
                              fit: BoxFit.cover,
                            ).onTap(() {
                              controller.pickImage(index, context);
                            })
                          : productImages(label: '${index + 1}').onTap(() {
                              controller.pickImage(index, context);
                            })),
                ),
              ),
              10.heightBox,
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
              Wrap(
                spacing: 9,
                runSpacing: 9,
                children: List.generate(
                    9,
                    (index) => Obx(
                          () => Stack(
                            alignment: Alignment.center,
                            children: [
                              VxBox()
                                  .color(Vx.randomColor)
                                  .roundedFull
                                  .size(70, 70)
                                  .make()
                                  .onTap(() {
                                controller.selectedColorIndex.value = index;
                              }),
                              controller.selectedColorIndex.value == index
                                  ? const Icon(
                                      Icons.done,
                                      color: white,
                                    )
                                  : const SizedBox()
                            ],
                          ),
                        )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
