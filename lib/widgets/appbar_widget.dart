import 'package:emart_seller/widgets/text_styles.dart';
import '../const/const.dart';
import 'package:intl/intl.dart' as intl;

AppBar appBarWidget(titile) {
  return AppBar(
    automaticallyImplyLeading: false,
    title: boldText(text: titile, size: 16.0, color: fontGrey),
    actions: [
      Center(
        child: normalText(
          text: intl.DateFormat('yyyy-MM-dd').format(DateTime.now()),
          color: purpleColor,
        ),
      ),
      10.widthBox,
    ],
  );
}
