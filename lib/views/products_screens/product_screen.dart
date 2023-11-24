import '../../const/const.dart';
import '../../const/firebase_consts.dart';
import '../../controllers/product_controller.dart';
import '../../services/firebase_services.dart';
import '../../views/products_screens/add_product_screen.dart';
import '../../views/products_screens/product_details_screen.dart';
import '../../widgets/appbar_widget.dart';
import '../../widgets/text_styles.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProductController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await controller.getCategory();
          controller.populateCategoryList();
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
        child: StreamBuilder(
          stream: FirestoreServices.getProducts(currentUser!.uid),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(purpleColor),
                ),
              );
            } else {
              var data = snapshot.data!.docs;
              return Column(
                children: List.generate(
                  data.length,
                  (index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Card(
                      child: ListTile(
                        onTap: () {
                          Get.to(() => ProductDetailsScreen(
                                data: data[index],
                              ));
                        },
                        leading: Image.network(
                          '${data[index]['p_images'][index]}',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                        title: boldText(
                            text: '${data[index]['p_name']}',
                            size: 16.0,
                            color: fontGrey),
                        subtitle: Row(
                          children: [
                            normalText(
                                text: '\$${data[index]['p_price']}',
                                size: 16.0,
                                color: darkGrey),
                            10.widthBox,
                            boldText(
                              text: data[index]['is_featured'] == true
                                  ? 'Featured'
                                  : '',
                              size: 12.0,
                              color: green,
                            )
                          ],
                        ),
                        trailing: VxPopupMenu(
                          arrowColor: white,
                          arrowSize: 12,
                          menuBuilder: () => Column(
                            children: List.generate(
                              popupMenuTitles.length,
                              (i) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      popupMenuIcons[i],
                                      color: data[index]['featured_id'] ==
                                                  currentUser!.uid &&
                                              i == 0
                                          ? green
                                          : darkGrey,
                                    ),
                                    10.widthBox,
                                    normalText(
                                        text: data[index]['featured_id'] ==
                                                    currentUser!.uid &&
                                                i == 0
                                            ? 'Remove featured'
                                            : popupMenuTitles[i],
                                        size: 16.0,
                                        color: darkGrey)
                                  ],
                                ).onTap(() {
                                  switch (index) {
                                    case 1:
                                      if (data[index]['is_featured'] == true) {
                                        controller
                                            .removdeFeature(data[index].id);
                                        VxToast.show(context,
                                            msg: 'Removed from featured');
                                      } else {
                                        controller.addFeature(data[index].id);
                                        VxToast.show(context,
                                            msg: 'Added to Featured');
                                      }
                                      break;
                                    case 2:
                                      break;
                                    case 3:
                                      controller.removeProduct(data[index].id);
                                      VxToast.show(context,
                                          msg: 'Product Removed');
                                      break;
                                  }
                                }),
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
              );
            }
          },
        ),
      ),
    );
  }
}
