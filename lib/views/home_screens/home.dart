import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/controllers/home_controller.dart';
import 'package:emart_seller/views/home_screens/home_screen.dart';
import 'package:emart_seller/views/orders_screens/order_screen.dart';
import 'package:emart_seller/views/products_screens/product_screen.dart';
import 'package:emart_seller/views/profile_screens/profile_screen.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());

    var navScreen = [
      const HomeScreen(),
      const ProductScreen(),
      const OrderScreen(),
      const ProfileScreen(),
    ];
    //Bottom
    var bottomNavBar = [
      const BottomNavigationBarItem(
          icon: Icon(Icons.home, size: 30), label: dashboard),
      BottomNavigationBarItem(
          icon: Image.asset(ordersIcon, width: 24, color: darkGrey),
          label: productsText),
      BottomNavigationBarItem(
          icon: Image.asset(productsIcon, width: 24, color: darkGrey),
          label: ordersText),
      BottomNavigationBarItem(
          icon: Image.asset(generalSettingIcon, width: 24, color: darkGrey),
          label: settingText),
    ];
    return Scaffold(
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          onTap: (value) {
            controller.navbarIndex.value = value;
          },
          currentIndex: controller.navbarIndex.value,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: purpleColor,
          unselectedItemColor: darkGrey,
          items: bottomNavBar,
        ),
      ),
      body: Column(
        children: [
          Obx(
            () => Expanded(
              child: navScreen.elementAt(controller.navbarIndex.value),
            ),
          ),
        ],
      ),
    );
  }
}
