import 'package:get/get.dart';

import '../model/coffee_model.dart';

class CartController extends GetxController {
  var cart = <String, Coffee>{}.obs;

  void addToCart(Coffee coffee) {
    if (cart.containsKey(coffee.title)) {
      cart[coffee.title]!.quantity.value += 1;
    } else {
      coffee.quantity.value = 1;
      cart[coffee.title] = coffee;
    }
  }

  void addToCartWithQuantity(Coffee coffee, int qty) {
    if (cart.containsKey(coffee.title)) {
      cart[coffee.title]!.quantity.value += qty;
    } else {
      Coffee newCoffee = Coffee(
        title: coffee.title,
        subTitle: coffee.subTitle,
        price: coffee.price,
        image: coffee.image,
        description: coffee.description,
      );
      newCoffee.quantity.value = qty;
      cart[coffee.title] = newCoffee;
    }
  }

  void updateQuantity(String title, int change) {
    if (cart.containsKey(title)) {
      Coffee coffee = cart[title]!;
      coffee.quantity.value += change;

      if (coffee.quantity.value <= 0) {
        cart.remove(title);
      }
    }
  }
}
