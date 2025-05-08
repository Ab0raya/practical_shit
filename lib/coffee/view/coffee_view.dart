import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/cart_controller.dart';
import '../model/coffee_model.dart';

class CoffeeView extends StatelessWidget {
  CoffeeView({super.key, required this.coffee});

  final Coffee coffee;
  final CartController controller = Get.put(CartController());
  final RxInt tempQuantity = 1.obs;

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white10,
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: screenWidth * 0.02, horizontal: screenWidth * 0.04),
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.04),
            Row(
              children: [
                IconButton(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.arrow_back_ios_new),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.04),
            Image.asset(
              coffee.image,
              width: screenWidth * 0.8,
              height: screenHeight * 0.3,
            ),
            SizedBox(height: screenHeight * 0.04),
            Row(
              children: [
                Text(
                  coffee.subTitle,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontSize: 20,
                    letterSpacing: 1.7,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  coffee.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: screenWidth * 0.3,
                  height: screenHeight * 0.06,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white.withOpacity(0.3), width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          if (tempQuantity.value > 1) {
                            tempQuantity.value--;
                          }
                        },
                        icon: const Icon(Icons.remove, color: Colors.white),
                      ),
                      Obx(() => Text(
                        '${tempQuantity.value}',
                        style: const TextStyle(color: Colors.white, fontSize: 20),
                      )),
                      IconButton(
                        onPressed: () {
                          tempQuantity.value++;
                        },
                        icon: const Icon(Icons.add, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Text(
                  '${coffee.price} \$',
                  style: const TextStyle(color: Colors.white, fontSize: 25),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.07),
            Row(
              children: [
                Expanded(
                  child: Text(
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    coffee.description,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 20,
                      letterSpacing: 1.7,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.04),
            const Row(
              children: [
                Text(
                  'Volume : 60ml',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.04),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MaterialButton(
                  onPressed: () {

                    controller.addToCartWithQuantity(coffee, tempQuantity.value);
                    Get.snackbar(
                      'Cart Updated',
                      '${tempQuantity.value} ${coffee.title} added to cart',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.black87,
                      colorText: Colors.white,
                    );
                  },
                  child: Container(
                    width: screenWidth * 0.4,
                    height: screenHeight * 0.06,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Text(
                      'Add to cart',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                Container(
                  width: screenWidth * 0.15,
                  height: screenHeight * 0.06,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(CupertinoIcons.heart, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}