import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/widgets/text_styles.dart';

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
          const Icon(Icons.edit, color: white),
          10.widthBox,
          Center(child: normalText(text: logout, color: white)),
          10.widthBox,
        ],
      ),
    );
  }
}
