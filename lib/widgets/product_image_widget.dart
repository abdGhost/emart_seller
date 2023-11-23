import '../const/const.dart';

Widget productImages({required label, onPress}) {
  return "$label".text.bold.makeCentered().box.size(80, 80).color(white).make();
}
