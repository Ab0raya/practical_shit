
import 'burger_model.dart';

class CartItem {
  final BurgerModel burger;
  int quantity;

  CartItem({required this.burger, this.quantity = 1});
}
