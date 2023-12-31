import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/controllers/auth_controller.dart';
import 'package:emart_seller/views/home_screens/home.dart';
import 'package:emart_seller/widgets/our_button.dart';
import 'package:emart_seller/widgets/text_styles.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());
    return Scaffold(
      backgroundColor: purpleColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  30.heightBox,
                  normalText(text: welcome, size: 18.0),
                  10.heightBox,
                  Row(
                    children: [
                      Image.asset(
                        logoIcon,
                        height: 70,
                        width: 70,
                      )
                          .box
                          .border(color: white)
                          .rounded
                          .padding(const EdgeInsets.all(8))
                          .make(),
                      10.widthBox,
                      boldText(text: appname, size: 16.0),
                    ],
                  ),
                  40.heightBox,
                  normalText(text: logInText, size: 16.0, color: darkGrey),
                  20.heightBox,
                  Column(
                    children: [
                      TextFormField(
                        controller: controller.emailController,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: textfieldGrey,
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.email,
                            color: purpleColor,
                          ),
                          hintText: emailHint,
                        ),
                      ),
                      20.heightBox,
                      TextFormField(
                        controller: controller.passwordController,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: textfieldGrey,
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.lock,
                            color: purpleColor,
                          ),
                          hintText: passwordHint,
                        ),
                      ),
                      10.heightBox,
                      SizedBox(
                        width: double.infinity - 100,
                        child: controller.isLoading.value
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : ourButton(
                                radius: 10.0,
                                titile: login,
                                color: purpleColor,
                                onPress: () {
                                  // Get.to(() => const Home());
                                  controller.isLoading(true);
                                  controller
                                      .loginMethod(context: context)
                                      .then((value) {
                                    if (value != null) {
                                      controller.isLoading(false);
                                      VxToast.show(context,
                                          msg: 'Logged Succesfull');
                                      Get.offAll(() => const Home());
                                    } else {
                                      controller.isLoading(false);
                                    }
                                  });
                                },
                              ),
                      ),
                      10.heightBox,
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: normalText(
                            text: forgotPassword,
                            color: purpleColor,
                          ),
                        ),
                      )
                    ],
                  )
                      .box
                      .rounded
                      .white
                      .outerShadowMd
                      .padding(const EdgeInsets.all(8))
                      .make(),
                  10.heightBox,
                  Center(
                    child: normalText(
                      text: anyProblem,
                      color: lightGrey,
                    ),
                  ),
                  const Spacer(),
                  Center(
                    child: boldText(
                      text: credit,
                    ),
                  ),
                  20.heightBox,
                ],
              ),
            )),
      ),
    );
  }
}
