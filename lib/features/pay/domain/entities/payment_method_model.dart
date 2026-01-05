
import 'package:round_7_mobile_cure_team4/core/helper/assets.dart';

class PayMethodModel {
  final String title;

  final String image;

  PayMethodModel({required this.title, required this.image});
}

List<PayMethodModel> mockPaymentMethod = [
  PayMethodModel(title: "visa", image: "assets/svg/brandico_visa.svg"),
  PayMethodModel(title: "paypal", image: "assets/svg/ic_outline-paypal.svg"),
  PayMethodModel(title: "cash", image: SvgAssets.banknote),
];
