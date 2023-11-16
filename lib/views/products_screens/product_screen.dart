import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/views/products_screens/add_product_screen.dart';
import 'package:emart_seller/views/products_screens/product_details_screen.dart';
import 'package:emart_seller/widgets/appbar_widget.dart';
import 'package:emart_seller/widgets/text_styles.dart';
import 'package:get/get.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => const AddProductScreen());
        },
        backgroundColor: purpleColor,
        child: const Icon(
          Icons.add,
        ),
      ),
      appBar:
          appBarWidget(titile: productsText, color: white, fontColor: fontGrey),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: List.generate(
            20,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Card(
                child: ListTile(
                  onTap: () {
                    Get.to(() => const ProductDetailsScreen());
                  },
                  leading: Image.asset(productIcon,
                      width: 100, height: 100, fit: BoxFit.cover),
                  title:
                      boldText(text: 'Products', size: 16.0, color: fontGrey),
                  subtitle:
                      normalText(text: '\$40', size: 16.0, color: darkGrey),
                  trailing: VxPopupMenu(
                    arrowColor: white,
                    arrowSize: 12,
                    menuBuilder: () => Column(
                      children: List.generate(
                        popupMenuTitles.length,
                        (index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(popupMenuIcons[index]),
                              10.widthBox,
                              normalText(
                                  text: popupMenuTitles[index],
                                  size: 16.0,
                                  color: darkGrey)
                            ],
                          ).onTap(() {}),
                        ),
                      ),
                    ).box.roundedSM.width(200).white.make(),
                    clickType: VxClickType.singleClick,
                    child: const Icon(Icons.more_vert_rounded),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
