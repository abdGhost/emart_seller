import 'package:emart_seller/widgets/custom_textfield_widget.dart';
import 'package:emart_seller/widgets/text_styles.dart';

import '../../const/const.dart';

class ShopSettingsScreen extends StatelessWidget {
  const ShopSettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      appBar: AppBar(
        title: boldText(text: shopSetting, color: white),
        actions: [
          TextButton(
              onPressed: () {}, child: normalText(text: save, color: white))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            customTextfieldWidget(label: shopName, hint: nameHint),
            10.heightBox,
            customTextfieldWidget(label: address, hint: shopAdressHint),
            10.heightBox,
            customTextfieldWidget(label: mobile, hint: shopMobileHint),
            10.heightBox,
            customTextfieldWidget(label: website, hint: shopWebsiteHint),
            10.heightBox,
            customTextfieldWidget(
                label: description, hint: shopDescHint, isDesc: true),
          ],
        ),
      ),
    );
  }
}
