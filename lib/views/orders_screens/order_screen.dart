import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/views/orders_screens/order_details_screen.dart';
import 'package:emart_seller/widgets/appbar_widget.dart';
import 'package:emart_seller/widgets/text_styles.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart' as intl;

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          appBarWidget(titile: ordersText, color: white, fontColor: fontGrey),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: List.generate(
                20,
                (index) => ListTile(
                  onTap: () {
                    Get.to(() => const OrderDetailsScreen());
                  },
                  tileColor: textfieldGrey,
                  title: boldText(
                    text: '12354657478',
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
                              text: intl.DateFormat()
                                  .add_yMd()
                                  .format(DateTime.now()),
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
                  trailing: boldText(text: '\$40', size: 16.0, color: fontGrey),
                ).box.margin(const EdgeInsets.only(bottom: 4)).make(),
              ),
            )),
      ),
    );
  }
}
