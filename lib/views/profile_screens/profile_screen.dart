import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/controllers/auth_controller.dart';
import 'package:emart_seller/views/messages_screens/messages_screen.dart';
import 'package:emart_seller/views/profile_screens/edit_profile_screen.dart';
import 'package:emart_seller/views/shop_screens/shop_settings_screen.dart';
import 'package:emart_seller/widgets/text_styles.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: settingText.text.make(),
        actions: [
          TextButton(
              onPressed: () {
                Get.to(() => const EditProfileScreen());
              },
              child: const Icon(
                Icons.edit,
                color: white,
              )),
          TextButton(
            onPressed: () async {
              await Get.find<AuthController>().signOutMethod();
            },
            child: normalText(text: logout),
          )
        ],
      ),
      body: Column(
        children: [
          ListTile(
            leading: Image.asset(productIcon)
                .box
                .roundedFull
                .clip(Clip.antiAlias)
                .make(),
            title: boldText(
              text: "Vendor Name",
            ),
            subtitle: normalText(text: "vendor@emart.com"),
          ),
          const Divider(
            color: white,
          ),
          10.heightBox,
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: List.generate(
                profileButtonIcons.length,
                (index) => ListTile(
                  onTap: () {
                    switch (index) {
                      case 0:
                        Get.to(() => const ShopSettingsScreen());
                        break;
                      case 1:
                        Get.to(() => const MessagesScreen());
                        break;
                      default:
                    }
                  },
                  leading: Icon(profileButtonIcons[index], color: white),
                  title: normalText(text: profileButtonTitle[index]),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
