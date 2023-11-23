import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/widgets/text_styles.dart';

Widget productDropdownWidget() {
  return DropdownButtonHideUnderline(
    child: DropdownButton(
      hint: normalText(text: 'Choose Category', color: fontGrey),
      value: null,
      isExpanded: true,
      items: const [],
      onChanged: (value) {},
    ),
  )
      .box
      .padding(const EdgeInsets.symmetric(horizontal: 8))
      .roundedSM
      .white
      .make();
}
