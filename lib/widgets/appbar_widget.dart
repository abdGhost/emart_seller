import 'package:emart_seller/widgets/text_styles.dart';
import '../const/const.dart';
import 'package:intl/intl.dart' as intl;

AppBar appBarWidget({titile, color, fontColor}) {
  return AppBar(
    backgroundColor: color,
    automaticallyImplyLeading: false,
    title: boldText(text: titile, size: 16.0, color: fontColor),
    actions: [
      Center(
        child: normalText(
          text: intl.DateFormat('yyyy-MM-dd').format(DateTime.now()),
          color: fontColor,
        ),
      ),
      10.widthBox,
    ],
  );
}
