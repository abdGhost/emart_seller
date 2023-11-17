import '../../const/colors.dart';
import '../../widgets/custom_textfield_widget.dart';
import '../../widgets/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            customTextfieldWidget(
              hint: 'eg. BMW',
              label: 'Product Name',
              isDesc: false,
              controller: null,
            ),
          ],
        ),
      ),
    );
  }
}
