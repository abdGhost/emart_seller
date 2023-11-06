import 'package:emart_seller/widgets/text_styles.dart';

import '../const/const.dart';

Widget ourButton({titile, onPress, color}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(12)),
    onPressed: onPress,
    child: normalText(text: titile, size: 16.0),
  );
}
