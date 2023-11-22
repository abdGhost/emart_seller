import 'package:emart_seller/controllers/orders_controller.dart';

import '../../const/const.dart';
import '../../widgets/our_button.dart';
import '../../widgets/text_styles.dart';
import 'package:get/get.dart';

import 'components/order_place_details.dart';
import 'package:intl/intl.dart' as intl;

class OrderDetailsScreen extends StatefulWidget {
  final data;
  const OrderDetailsScreen({super.key, this.data});

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  @override
  void initState() {
    super.initState();
    controller.getOrders(widget.data);
    controller.confirmed.value = widget.data['order_confirmed'];
    controller.onDelivery.value = widget.data['order_on_delivery'];
    controller.delivered.value = widget.data['order_deliveried'];
  }

  var controller = Get.find<OrdersController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
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
        bottomNavigationBar: Visibility(
          visible: !controller.confirmed.value,
          child: SizedBox(
            height: 60,
            width: context.screenWidth,
            child: ourButton(
                color: green,
                onPress: () {
                  controller.confirmed(true);
                  controller.changeStatus(
                      titile: 'order_confirmed',
                      status: true,
                      docId: widget.data.id);
                },
                titile: "Confirm Order",
                radius: 0.0),
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
                  // Order Delivery Section
                  Visibility(
                    visible: controller.confirmed.value,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        boldText(text: 'Order Status', color: fontGrey),
                        SwitchListTile(
                          value: false,
                          onChanged: (value) {},
                          title: boldText(text: 'Placed', color: fontGrey),
                          activeColor: green,
                        ),
                        SwitchListTile(
                          value: false,
                          onChanged: (value) {
                            controller.confirmed.value = value;
                            controller.confirmed(true);
                            controller.changeStatus(
                                titile: 'order_confirmed',
                                status: value,
                                docId: widget.data.id);
                          },
                          title: boldText(text: 'Confirmed', color: fontGrey),
                          activeColor: green,
                        ),
                        SwitchListTile(
                          value: false,
                          onChanged: (value) {
                            controller.onDelivery.value = value;
                            controller.confirmed(true);
                            controller.changeStatus(
                                titile: 'order_on_delivery',
                                status: value,
                                docId: widget.data.id);
                          },
                          title: boldText(
                              text: 'On Delivery', color: fontGrey, size: 16.0),
                          activeColor: green,
                        ),
                        SwitchListTile(
                          value: false,
                          onChanged: (value) {
                            controller.delivered.value = value;
                            controller.changeStatus(
                                titile: 'order_deliveried',
                                status: value,
                                docId: widget.data.id);
                          },
                          title: boldText(text: 'Delivered', color: fontGrey),
                          activeColor: green,
                        )
                      ],
                    )
                        .box
                        .padding(const EdgeInsets.all(8))
                        .outerShadowSm
                        .border(color: lightGrey)
                        .white
                        .make(),
                  ),

                  // Order Details Section
                  Column(
                    children: [
                      orderPlacedetails(
                        title1: 'Order Code',
                        detail1: "${widget.data['order_code']}",
                        title2: 'Shipping Method',
                        detail2: '${widget.data["shipping_method"]}',
                      ),
                      orderPlacedetails(
                        title1: 'Order Date',
                        //For formating date
                        detail1: intl.DateFormat()
                            .add_yMd()
                            .format(widget.data['order_date'].toDate()),
                        // detail1: DateTime.now().day,
                        title2: 'Payment Method',
                        detail2: '${widget.data['payment_method']}',
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
                                    color: white,
                                    size: 14.0),
                                "${widget.data['order_by_name']}"
                                    .text
                                    .size(12)
                                    .white
                                    .make(),
                                "${widget.data['order_by_email']}"
                                    .text
                                    .size(12)
                                    .white
                                    .make(),
                                "${widget.data['order_by_address']}'"
                                    .text
                                    .size(12)
                                    .white
                                    .make(),
                                "${widget.data['order_by_city']}'"
                                    .text
                                    .size(12)
                                    .white
                                    .make(),
                                "${widget.data['order_by_state']}'"
                                    .text
                                    .size(12)
                                    .white
                                    .make(),
                                "${widget.data['order_by_phone']}'"
                                    .text
                                    .size(12)
                                    .white
                                    .make(),
                                "${widget.data['order_by_postalCode']}"
                                    .text
                                    .size(12)
                                    .white
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
                                      color: white,
                                      size: 14.0),
                                  boldText(
                                      text: '\$${widget.data['total_amount']}',
                                      color: red,
                                      size: 12.0),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                      .box
                      .outerShadowSm
                      .border(color: const Color.fromARGB(255, 77, 14, 145))
                      .color(purpleColor)
                      .make(),
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
                      controller.orders.length,
                      (index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            orderPlacedetails(
                              title1: '${controller.orders[index]['title']}',
                              detail1:
                                  '${controller.orders[index]['quantity']}x',
                              title2:
                                  '${controller.orders[index]['totalPrice']}',
                              detail2: 'Refundable',
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2),
                              child: Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  color:
                                      Color(controller.orders[index]['color']),
                                  // color: purpleColor,
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
                      .color(purpleColor)
                      .border(color: const Color.fromARGB(255, 77, 14, 145))
                      .margin(const EdgeInsets.only(bottom: 4))
                      .make(),
                  20.heightBox,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
