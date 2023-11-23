import 'package:emart_seller/widgets/text_styles.dart';
import 'package:get/get.dart';

import '../../const/const.dart';

class ProductDetailsScreen extends StatelessWidget {
  final dynamic data;
  const ProductDetailsScreen({
    super.key,
    this.data,
  });

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
          text: '${data['p_name']}'.toUpperCase(),
          color: fontGrey,
          size: 16.0,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            VxSwiper.builder(
                itemCount: data['p_images'].length,
                autoPlay: true,
                height: 350,
                itemBuilder: (context, index) {
                  return Image.network(
                    '${data['p_images'][index]}',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  );
                }),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  boldText(
                      text: "${data['p_name']}".toUpperCase(),
                      color: fontGrey,
                      size: 16.0),
                  10.heightBox,
                  VxRating(
                    isSelectable: false,
                    // value: double.parse(data['p_rating']),
                    value: 2,
                    onRatingUpdate: ((value) {}),
                    count: 5,
                    normalColor: textfieldGrey,
                    selectionColor: golden,
                    size: 25,
                    // stepInt: true,
                  ),
                  10.heightBox,
                  normalText(
                      text: "\$${data['p_price']}", color: red, size: 14.0),
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
                                data['p_color'].length,
                                (index) {
                                  return VxBox()
                                      .size(40, 40)
                                      .color(Color(data['p_color'][index])
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
                            normalText(
                                text: "${data['p_quantity']}",
                                color: fontGrey,
                                size: 16.0)
                          ],
                        ),
                        20.heightBox,
                        boldText(
                            text: "Description", color: fontGrey, size: 16.0),
                        5.heightBox,
                        normalText(
                            text: "${data['p_description']}",
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
