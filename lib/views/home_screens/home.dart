import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/widgets/text_styles.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    var bottomNavBar = [
      const BottomNavigationBarItem(icon: Icon(Icons.home, size: 30), label: dashboard),
      BottomNavigationBarItem(icon: Image.asset(productsIcon, width: 24, color: darkGrey), label: ordersText),
      BottomNavigationBarItem(icon: Image.asset(ordersIcon, width: 24, color: darkGrey), label: productsText),
      BottomNavigationBarItem(icon: Image.asset(generalSettingIcon, width: 24, color: darkGrey), label: settingText),
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
