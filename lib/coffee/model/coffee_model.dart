import 'package:get/get.dart';

class Coffee {
  final String title;
  final String subTitle;
  final double price;
  final String image;
  final String description;
  final RxInt quantity = 0.obs;

  Coffee({
    required this.title,
    required this.subTitle,
    required this.price,
    required this.image,
    required this.description,
  });
}