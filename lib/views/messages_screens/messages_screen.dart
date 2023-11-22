import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/const/firebase_consts.dart';
import 'package:emart_seller/views/messages_screens/chat_screen.dart';
import 'package:emart_seller/widgets/text_styles.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;

import '../../services/firebase_services.dart';

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
        child: StreamBuilder(
            stream: FirestoreServices.getMessagesData(uid: currentUser!.uid),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                var data = snapshot.data!.docs;
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: List.generate(data.length, (index) {
                      var t = data[index]['created_on'] ?? DateTime.now();
                      var formattedDateTime =
                          intl.DateFormat('h:mma').format(t);
                      return ListTile(
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
                        title: boldText(
                            text: '${data[index]['sender_name']}',
                            color: white),
                        subtitle: normalText(
                            text: '${data[index]['last_message']}',
                            color: white),
                        trailing:
                            normalText(text: formattedDateTime, color: white),
                      );
                    }),
                  ),
                );
              }
            }),
      ),
    );
  }
}
