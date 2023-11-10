import 'package:emart_seller/widgets/appbar_widget.dart';
import 'package:emart_seller/widgets/dashboard_button.dart';
import 'package:emart_seller/widgets/text_styles.dart';

import '../../const/const.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          appBarWidget(titile: dashboard, color: white, fontColor: fontGrey),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                dashboardButton(context,
                    titile: productsText, count: "60", icon: productsIcon),
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
                3,
                (index) => ListTile(
                  leading: Image.asset(productIcon,
                      width: 100, height: 100, fit: BoxFit.cover),
                  title: boldText(text: 'Product ', color: fontGrey),
                  subtitle: normalText(text: '\$40', color: darkGrey),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
