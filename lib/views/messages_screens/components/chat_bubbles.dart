import 'package:emart_seller/widgets/text_styles.dart';

import '../../../const/const.dart';

Widget chatBubbles() {
  return Directionality(
    textDirection: TextDirection.rtl,
    child: Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: const BoxDecoration(
        color: white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          normalText(text: 'Message Here....', color: purpleColor),
          10.heightBox,
          normalText(text: '10:30AM', color: purpleColor),
        ],
      ),
    ),
  );
}
