import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/widgets/text_styles.dart';
import 'package:get/get.dart';

import 'components/order_place_details.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: purpleColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
            color: white,
          ),
        ),
        title: boldText(
          text: "Order Details",
          color: white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Column(
                  children: [
                    orderPlacedetails(
                      title1: 'Order Code',
                      detail1: "'{data['order_code']}'",
                      title2: 'Shipping Method',
                      detail2: "'{data['shipping_method']}'",
                    ),
                    orderPlacedetails(
                      title1: 'Order Date',
                      //For formating date
                      // detail1: intl.DateFormat()
                      //     .add_yMd()
                      //     .format(data['order_date'].toDate()),
                      detail1: DateTime.now().day,
                      title2: 'Payment Method',
                      detail2: "'{data['payment_method']}'",
                    ),
                    orderPlacedetails(
                      title1: 'Payment Status',
                      //For formating date
                      detail1: "Unpaid",
                      title2: 'Delivery Status',
                      detail2: 'Order Placed',
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              boldText(
                                  text: "Shipping Address",
                                  color: purpleColor,
                                  size: 14.0),
                              "{data['order_by_name']}".text.size(12).make(),
                              "{data['order_by_email']}".text.size(12).make(),
                              "{data['order_by_address']}'"
                                  .text
                                  .size(12)
                                  .make(),
                              "{data['order_by_city']}'".text.size(12).make(),
                              "{data['order_by_state']}'".text.size(12).make(),
                              "{data['order_by_phone']}'".text.size(12).make(),
                              "{data['order_by_postalCode']}"
                                  .text
                                  .size(12)
                                  .make(),
                            ],
                          ),
                          SizedBox(
                            width: 100,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                boldText(
                                    text: 'Total Amount',
                                    color: darkGrey,
                                    size: 14.0),
                                boldText(text: '1000', color: red, size: 12.0),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ).box.outerShadowSm.white.make(),
                const Divider(),
                10.heightBox,
                // 'Ordered Product'.text.fontFamily(bold).size(16).make(),
                boldText(text: 'Ordered Product', color: white, size: 16.0),
                10.heightBox,
                ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: List.generate(
                    // data['orders'].length,
                    4,
                    (index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          orderPlacedetails(
                            title1: "'{data['orders'][index]['title']}'",
                            detail1: "'{data['orders'][index]['quantity']}x'",
                            title2: "'{data['orders'][index]['totalPrice']}",
                            detail2: 'Refundable',
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                // color: Color(data['orders'][index]['color']),
                                color: purpleColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const Divider(
                            color: purpleColor,
                          ),
                        ],
                      );
                    },
                  ).toList(),
                )
                    .box
                    .outerShadowMd
                    .white
                    .margin(const EdgeInsets.only(bottom: 4))
                    .make(),
                20.heightBox,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
