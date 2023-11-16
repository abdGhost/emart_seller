import 'package:emart_seller/widgets/text_styles.dart';

import '../../../const/const.dart';

Widget orderPlacedetails({title1, title2, detail1, detail2}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            boldText(text: "$title1", color: purpleColor, size: 12.0),
            boldText(text: "$detail1", color: purpleColor, size: 12.0),
          ],
        ),
        SizedBox(
          width: 130,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              boldText(text: "$title2", color: purpleColor, size: 14.0),
              boldText(text: "$detail2", color: purpleColor, size: 14.0),
            ],
          ),
        ),
      ],
    ),
  );
}
