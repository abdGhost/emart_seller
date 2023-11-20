import 'package:emart_seller/widgets/text_styles.dart';
import 'package:get/get.dart';

import '../../const/const.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: fontGrey,
            )),
        title: boldText(
          text: "Product Details",
          color: fontGrey,
          size: 16.0,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VxSwiper.builder(
                itemCount: 3,
                // aspectRatio: 16 / 9,
                autoPlay: true,
                height: 350,
                itemBuilder: (context, index) {
                  // return Image.network(
                  //   data['p_images'][index],
                  //   width: double.infinity,
                  //   fit: BoxFit.cover,
                  // );
                  return Image.asset(
                    productIcon,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  );
                }),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  boldText(text: "Product Detail", color: fontGrey, size: 16.0),
                  10.heightBox,
                  VxRating(
                    isSelectable: false,
                    // value: double.parse(data['p_rating']),
                    value: 3,
                    onRatingUpdate: ((value) {}),
                    count: 5,
                    normalColor: textfieldGrey,
                    selectionColor: golden,
                    size: 25,
                    // stepInt: true,
                  ),
                  10.heightBox,
                  // "${data['p_price']}"
                  //     .numCurrency
                  //     .text
                  //     .fontFamily(bold)
                  //     .size(18)
                  //     .color(redColor)
                  //     .make(),
                  normalText(text: "\$100", color: red, size: 14.0),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: 'Color: '.text.color(fontGrey).make(),
                            ),
                            Row(
                              children: List.generate(
                                3,
                                (index) {
                                  return VxBox()
                                      .size(40, 40)
                                      .color((Vx.randomPrimaryColor)
                                          .withOpacity(1))
                                      .roundedFull
                                      .margin(const EdgeInsets.symmetric(
                                          horizontal: 4))
                                      .make()
                                      .onTap(() {
                                    // controller.changeColorIndex(index);
                                  });
                                },
                              ),
                            )
                          ],
                        ),
                        10.heightBox,
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: 'Quantity: '.text.color(fontGrey).make(),
                            ),
                            normalText(text: '20', color: fontGrey, size: 16.0)
                          ],
                        ),
                        20.heightBox,
                        boldText(
                            text: "Description", color: fontGrey, size: 16.0),
                        5.heightBox,
                        normalText(
                            text: "Description of this item here..",
                            color: fontGrey,
                            size: 14.0),
                        10.heightBox,
                      ],
                    ).box.white.padding(const EdgeInsets.all(8)).make(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
