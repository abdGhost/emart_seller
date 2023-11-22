import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/const/firebase_consts.dart';
import 'package:emart_seller/controllers/orders_controller.dart';
import 'package:emart_seller/services/firebase_services.dart';
import 'package:emart_seller/views/orders_screens/order_details_screen.dart';
import 'package:emart_seller/widgets/appbar_widget.dart';
import 'package:emart_seller/widgets/text_styles.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(OrdersController());
    return Scaffold(
      appBar:
          appBarWidget(titile: ordersText, color: white, fontColor: fontGrey),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: StreamBuilder(
            stream: FirestoreServices.getOrders(currentUser!.uid),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                print(currentUser!.uid);
                var data = snapshot.data!.docs;
                return Column(
                  children: List.generate(data.length, (index) {
                    var time = data[index]['order_date'].toDate;
                    return ListTile(
                      onTap: () {
                        Get.to(
                          () => OrderDetailsScreen(
                            data: data[index],
                          ),
                        );
                      },
                      tileColor: textfieldGrey,
                      title: boldText(
                        text: '${data[index]['order_code']}',
                        color: purpleColor,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      subtitle: Column(
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.calendar_month, color: fontGrey),
                              10.widthBox,
                              boldText(
                                  text:
                                      intl.DateFormat().add_yMd().format(time),
                                  color: fontGrey)
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(Icons.payment, color: fontGrey),
                              10.widthBox,
                              boldText(text: unPaid, color: red)
                            ],
                          ),
                        ],
                      ),
                      trailing: boldText(
                          text: '\$${data[index]['total_amount']}',
                          size: 16.0,
                          color: fontGrey),
                    ).box.margin(const EdgeInsets.only(bottom: 4)).make();
                  }),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
