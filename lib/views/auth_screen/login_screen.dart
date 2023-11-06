import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/widgets/text_styles.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              normalText(text: welcome, size: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
