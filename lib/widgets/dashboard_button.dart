import 'package:emart_seller/const/const.dart';
import 'text_styles.dart';

Widget dashboardButton(context, {titile, count, icon}) {
  var size = MediaQuery.of(context).size;

  return Row(
    children: [
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            boldText(text: titile, size: 16.0),
            boldText(text: count, size: 18.0),
          ],
        ),
      ),
      Image.asset(
        icon,
        width: 40,
        color: white,
      )
    ],
  )
      .box
      .color(purpleColor)
      .size(size.width * 0.4, 80)
      .padding(const EdgeInsets.all(4))
      .rounded
      .make();
}
