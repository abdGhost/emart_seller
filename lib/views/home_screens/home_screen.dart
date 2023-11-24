import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_seller/const/firebase_consts.dart';
import 'package:emart_seller/views/products_screens/product_details_screen.dart';
import 'package:emart_seller/widgets/appbar_widget.dart';
import 'package:emart_seller/widgets/dashboard_button.dart';
import 'package:emart_seller/widgets/text_styles.dart';
import 'package:get/get.dart';

import '../../const/const.dart';
import '../../services/firebase_services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var productlength = FirestoreServices.getProducts(currentUser!.uid);
    var orderLength = FirestoreServices.getOrders(currentUser!.uid);
    return Scaffold(
      appBar:
          appBarWidget(titile: dashboard, color: white, fontColor: fontGrey),
      body: StreamBuilder(
        stream: FirestoreServices.getProducts(currentUser!.uid),
        builder: (index, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            var data = snapshot.data!.docs;
            var popularProduct = data.sortedBy(
                (a, b) => b['p_wishlist'].length.compareTo(a['p_wishlist']));
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      dashboardButton(context,
                          titile: productsText,
                          count: productlength.length,
                          icon: productsIcon),
                      dashboardButton(context,
                          titile: ordersText, count: "60", icon: ordersIcon)
                    ],
                  ),
                  10.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      dashboardButton(context,
                          titile: rating, count: "60", icon: starIcon),
                      dashboardButton(context,
                          titile: totalSales, count: "60", icon: ordersIcon)
                    ],
                  ),
                  10.heightBox,
                  const Divider(),
                  10.heightBox,
                  boldText(
                    text: popularText,
                    size: 16.0,
                    color: fontGrey,
                  ),
                  10.heightBox,
                  ListView(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    children: List.generate(
                      popularProduct.length,
                      (index) => popularProduct.isEmpty
                          ? const SizedBox()
                          : ListTile(
                              onTap: () {
                                Get.to(() => ProductDetailsScreen(
                                      data: popularProduct[index],
                                    ));
                              },
                              leading: Image.network(
                                  '${popularProduct[index]['p_images'][0]}',
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover),
                              title: boldText(
                                  text: '${popularProduct[index]['p_name']}',
                                  color: fontGrey),
                              subtitle: normalText(
                                  text:
                                      '\$ ${popularProduct[index]['p_price']}',
                                  color: darkGrey),
                            ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
