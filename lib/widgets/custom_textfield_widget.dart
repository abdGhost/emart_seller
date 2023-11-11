import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/widgets/text_styles.dart';

Widget customTextfieldWidget({label, hint, controller, isDesc}) {
  return TextFormField(
    maxLines: isDesc ? 4 : 1,
    decoration: InputDecoration(
      isDense: true,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: white),
      ),
      label: normalText(text: label),
      hintText: hint,
      hintStyle: const TextStyle(color: white),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: white),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: white),
      ),
    ),
  );
}
