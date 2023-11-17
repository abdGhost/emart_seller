import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/widgets/custom_textfield_widget.dart';
import 'package:emart_seller/widgets/text_styles.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      appBar: AppBar(
        title: boldText(text: editProfile),
        actions: [TextButton(onPressed: () {}, child: normalText(text: save))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.asset(
              productIcon,
              width: 150,
            ).box.roundedFull.clip(Clip.antiAlias).make(),
            10.heightBox,
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: white,
              ),
              onPressed: () {},
              child: normalText(text: 'Change Image', color: fontGrey),
            ),
            10.heightBox,
            const Divider(color: white),
            10.heightBox,
            customTextfieldWidget(
              label: userName,
              hint: 'eg. Ghost',
              isDesc: false,
            ),
            10.heightBox,
            customTextfieldWidget(
              label: password,
              hint: passwordHint,
              isDesc: false,
            ),
            10.heightBox,
            customTextfieldWidget(
              label: confirmPassword,
              hint: passwordHint,
              isDesc: false,
            ),
          ],
        ),
      ),
    );
  }
}
