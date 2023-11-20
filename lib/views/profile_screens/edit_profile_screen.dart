import 'dart:io';

import '../../const/const.dart';
import '../../controllers/profile_controller.dart';
import '../../widgets/custom_textfield_widget.dart';
import '../../widgets/text_styles.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatefulWidget {
  final String? username;
  const EditProfileScreen({super.key, this.username});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  var controller = Get.put(ProfileController());
  @override
  void initState() {
    super.initState();
    controller.nameController.text = widget.username!;
    print(controller.nameController.text);
  }

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());

    return Obx(
      () => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: purpleColor,
        appBar: AppBar(
          title: boldText(text: editProfile),
          actions: [
            controller.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(white),
                    ),
                  )
                : TextButton(
                    onPressed: () async {
                      controller.isLoading(true);
                      if (controller.profileImagePath.value.isNotEmpty) {
                        await controller.uploadProfileImage();
                      } else {
                        controller.profileImageLink =
                            controller.snapshot!['imageUrl'];
                      }

                      if (controller.snapshot!['password'] ==
                          controller.oldPasswordController.text) {
                        await controller.changeAuthPassword(
                          email: controller.snapshot!['email'],
                          password: controller.oldPasswordController.text,
                          newPassword: controller.newPasswordController.text,
                        );
                        await controller.updateProfileData(
                          name: controller.nameController.text,
                          password: controller.newPasswordController.text,
                          imageUrl: controller.profileImagePath.value,
                        );
                        // ignore: use_build_context_synchronously
                        VxToast.show(context, msg: 'Profile Updated');
                      } else if (controller
                              .oldPasswordController.text.isEmptyOrNull &&
                          controller.newPasswordController.text.isEmptyOrNull) {
                        await controller.updateProfileData(
                          name: controller.nameController.text,
                          password: controller.snapshot!['password'],
                          imageUrl: controller.profileImagePath.value,
                        );
                      } else {
                        // ignore: use_build_context_synchronously
                        VxToast.show(context, msg: 'Wrong Old Password');
                        controller.isLoading(false);
                      }
                    },
                    child: normalText(text: save))
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                controller.snapshot!['imageUrl'] == '' &&
                        controller.profileImagePath.isEmpty
                    ? Image.asset(
                        productIcon,
                        width: 100,
                        fit: BoxFit.cover,
                      ).box.roundedFull.clip(Clip.antiAlias).make()
                    : controller.snapshot!['imageUrl'] != '' &&
                            controller.profileImageLink.isEmpty
                        ? Image.network(
                            controller.snapshot!['imageUrl'],
                            width: 100,
                            fit: BoxFit.cover,
                          ).box.roundedFull.clip(Clip.antiAlias).make()
                        : Image.file(
                            File(controller.profileImagePath.value),
                            width: 100,
                            fit: BoxFit.cover,
                          ).box.roundedFull.clip(Clip.antiAlias).make(),
                10.heightBox,
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: white,
                  ),
                  onPressed: () {
                    controller.changeProfileImage(context: context);
                  },
                  child: normalText(text: 'Change Image', color: fontGrey),
                ),
                10.heightBox,
                const Divider(color: white),
                10.heightBox,
                customTextfieldWidget(
                  label: userName,
                  hint: 'eg. Ghost',
                  isDesc: false,
                  controller: controller.nameController,
                ),
                20.heightBox,
                Align(
                    alignment: Alignment.centerLeft,
                    child: normalText(
                        text: 'Change Password', color: white, size: 16.0)),
                10.heightBox,
                customTextfieldWidget(
                  label: password,
                  hint: passwordHint,
                  isDesc: false,
                  controller: controller.oldPasswordController,
                ),
                10.heightBox,
                customTextfieldWidget(
                  label: confirmPassword,
                  hint: passwordHint,
                  isDesc: false,
                  controller: controller.newPasswordController,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
