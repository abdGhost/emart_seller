import 'package:emart_seller/controllers/profile_controller.dart';
import 'package:emart_seller/widgets/custom_textfield_widget.dart';
import 'package:emart_seller/widgets/text_styles.dart';
import 'package:get/get.dart';

import '../../const/const.dart';

class ShopSettingsScreen extends StatelessWidget {
  const ShopSettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    return Obx(() => Scaffold(
          backgroundColor: purpleColor,
          appBar: AppBar(
            title: boldText(text: shopSetting, color: white),
            actions: [
              TextButton(
                  onPressed: () {
                    controller.isLoading(true);
                    controller.updateShop(
                      shopName: controller.shopNameController.text,
                      shopAddress: controller.shopAddressController.text,
                      shopMobile: controller.shopMobileController.text,
                      shopWebsite: controller.shopWebsiteController.text,
                      shopDescription:
                          controller.shopDescriptionController.text,
                    );
                    VxToast.show(context, msg: 'Shop Information Updated');
                  },
                  child: normalText(text: save, color: white))
            ],
          ),
          body: controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      customTextfieldWidget(
                        label: shopName,
                        hint: nameHint,
                        isDesc: false,
                        controller: controller.shopNameController,
                      ),
                      10.heightBox,
                      customTextfieldWidget(
                        label: address,
                        hint: shopAdressHint,
                        isDesc: false,
                        controller: controller.shopAddressController,
                      ),
                      10.heightBox,
                      customTextfieldWidget(
                        label: mobile,
                        hint: shopMobileHint,
                        isDesc: false,
                        controller: controller.shopMobileController,
                      ),
                      10.heightBox,
                      customTextfieldWidget(
                        label: website,
                        hint: shopWebsiteHint,
                        isDesc: false,
                        controller: controller.shopWebsiteController,
                      ),
                      10.heightBox,
                      customTextfieldWidget(
                        label: description,
                        hint: shopDescHint,
                        isDesc: true,
                        controller: controller.shopDescriptionController,
                      ),
                    ],
                  ),
                ),
        ));
  }
}
