import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/cart_controller.dart';
import '../model/coffee_model.dart';

class CartView extends StatelessWidget {
  CartView({super.key});

  final CartController controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: AppBar(
        backgroundColor: Colors.white10,
        centerTitle: true,
        title: const Text(
          'Cart',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Obx(() {
          if (controller.cart.isEmpty) {
            return const Center(
              child: Text(
                'THE CART IS EMPTY',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            );
          }

          return ListView(
            children: controller.cart.values
                .map((coffee) => CartItem(
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              coffee: coffee,
              onIncrement: () => controller.updateQuantity(coffee.title, 1),
              onDecrement: () => controller.updateQuantity(coffee.title, -1),
            ))
                .toList(),
          );
        }),
      ),
    );
  }
}
class CartItem extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;
  final Coffee coffee;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const CartItem({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.coffee,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Image.asset(coffee.image, width: 50, height: 50),
          SizedBox(width: screenWidth * 0.1),
          Expanded(
            child: Text(
              coffee.title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
            ),
          ),
          IconButton(
            onPressed: onIncrement,
            icon: const Icon(Icons.add, color: Colors.white),
          ),

          Obx(() => Text(
            '${coffee.quantity.value}',
            style: const TextStyle(fontSize: 20, color: Colors.white),
          )),
          IconButton(
            onPressed: onDecrement,
            icon: const Icon(Icons.remove, color: Colors.white),
          ),
        ],
      ),
    );
  }
}