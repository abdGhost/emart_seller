import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/views/messages_screens/components/chat_bubbles.dart';
import 'package:emart_seller/widgets/text_styles.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      appBar: AppBar(
        title: boldText(text: 'Chats', color: white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return chatBubbles();
                  }),
            ),
            10.heightBox,
            SizedBox(
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                          hintStyle: TextStyle(color: white),
                          hintText: "Send Message...",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: white),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: white))),
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.send,
                        color: white,
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
