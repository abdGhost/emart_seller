import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/views/home_screens/home_screen.dart';
import 'package:emart_seller/views/orders_screens/order_screen.dart';
import 'package:emart_seller/views/products_screens/product_screen.dart';
import 'package:emart_seller/views/setting_screens/setting_screen.dart';
import 'package:emart_seller/widgets/text_styles.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    var navScreen = [
      const HomeScreen(),
      const ProductScreen(),
      const OrderScreen(),
      const SettingScreen(),
    ];
    //Bottom
    var bottomNavBar = [
      const BottomNavigationBarItem(
          icon: Icon(Icons.home, size: 30), label: dashboard),
      BottomNavigationBarItem(
          icon: Image.asset(productsIcon, width: 24, color: darkGrey),
          label: ordersText),
      BottomNavigationBarItem(
          icon: Image.asset(ordersIcon, width: 24, color: darkGrey),
          label: productsText),
      BottomNavigationBarItem(
          icon: Image.asset(generalSettingIcon, width: 24, color: darkGrey),
          label: settingText),
    ];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: normalText(text: dashboard, color: fontGrey, size: 18.0),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: purpleColor,
        unselectedItemColor: darkGrey,
        items: bottomNavBar,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }
}
