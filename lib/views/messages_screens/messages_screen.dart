import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/views/messages_screens/chat_screen.dart';
import 'package:emart_seller/widgets/text_styles.dart';
import 'package:get/get.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      appBar: AppBar(
        title: boldText(text: "Messages", color: white),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: List.generate(
                20,
                (index) => ListTile(
                      onTap: () {
                        Get.to(() => const ChatScreen());
                      },
                      leading: const CircleAvatar(
                        backgroundColor: white,
                        child: Icon(
                          Icons.person,
                          color: purpleColor,
                        ),
                      ),
                      title: boldText(text: "Username", color: white),
                      subtitle:
                          normalText(text: "last message..", color: white),
                      trailing: normalText(text: '12:00 PM', color: white),
                    )),
          ),
        ),
      ),
    );
  }
}
