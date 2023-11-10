import 'package:emart_seller/const/const.dart';
import 'package:emart_seller/widgets/appbar_widget.dart';
import 'package:emart_seller/widgets/text_styles.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: purpleColor,
        child: const Icon(
          Icons.add,
        ),
      ),
      appBar: appBarWidget(productsText),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: List.generate(
            20,
            (index) => ListTile(
              leading: Image.asset(productIcon,
                  width: 100, height: 100, fit: BoxFit.cover),
              title: boldText(text: 'Products', size: 16.0, color: fontGrey),
              subtitle: normalText(text: '\$40', size: 16.0, color: darkGrey),
            ),
          ),
        ),
      ),
    );
  }
}