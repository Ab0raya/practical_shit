import 'package:flutter/cupertino.dart';
import 'package:practical_shit/burger/model/cart_item.dart';

import '../model/burger_model.dart';

class CartProvider extends ChangeNotifier{

  final Map<String, CartItem> _items = {};

  Map<String, CartItem> get items => _items;

  void addToCart(BurgerModel burger) {
    if (_items.containsKey(burger.name)) {
      _items[burger.name]!.quantity++;
    } else {
      _items[burger.name] = CartItem(burger: burger);
    }
    notifyListeners();
  }

  void removeFromCart(BurgerModel burger) {
    if (_items.containsKey(burger.name)) {
      if (_items[burger.name]!.quantity > 1) {
        _items[burger.name]!.quantity--;
      } else {
        _items.remove(burger.name);
      }
      notifyListeners();
    }
  }

  double get totalPrice {
    return _items.values.fold(
      0.0,
          (sum, item) => sum + item.burger.price * item.quantity,
    );
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  int get itemCount {
    return _items.values.fold(0, (sum, item) => sum + item.quantity);
  }



}