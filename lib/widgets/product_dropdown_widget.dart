import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/controllers/product_controller.dart';
import 'package:emart_seller/widgets/text_styles.dart';
import 'package:get/get.dart';

Widget productDropdownWidget(
    hint, List<String> list, dropdown, ProductController controller) {
  return Obx(() => DropdownButtonHideUnderline(
        child: DropdownButton(
          hint: normalText(text: '$hint', color: fontGrey),
          value: dropdown.value == '' ? null : dropdown.value,
          isExpanded: true,
          items: list.map((e) {
            return DropdownMenuItem(
              value: e,
              child: e.text.make(),
            );
          }).toList(),
          onChanged: (value) {
            if (hint == 'Category') {
              controller.subCategoryValue.value = '';
              controller.populateSubCategory(value.toString());
            }
            dropdown.value = value.toString();
          },
        ),
      )
          .box
          .padding(const EdgeInsets.symmetric(horizontal: 8))
          .roundedSM
          .white
          .make());
}
