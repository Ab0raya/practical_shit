import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/tabs_controller.dart';
import '../model/coffee_model.dart';
import 'cart_view.dart';
import 'coffee_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TabsController controller = Get.put(TabsController());
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    var fakeData = {
      "data": [
        {
          "title": "Latte",
          "image": "assets/coffee/Latte.png",
          "subTitle": "Best coffee",
          "description": "Hot coffee brewed from roasted beans...",
          "quantity": 0,
          "isFav": false,
          "price": "30",
        },
        {
          "title": "Espresso",
          "image": "assets/coffee/Espresso.png",
          "subTitle": "Best coffee",
          "description": "Hot coffee brewed from roasted beans...",
          "quantity": 0,
          "isFav": false,
          "price": "30",
        },
        {
          "title": "Black Coffee",
          "image": "assets/coffee/Black Coffee.png",
          "subTitle": "Best coffee",
          "description": "Hot coffee brewed from roasted beans...",
          "quantity": 0,
          "isFav": false,
          "price": "30",
        },
        {
          "title": "Cold Coffee",
          "image": "assets/coffee/Cold Coffee.png",
          "subTitle": "Best coffee",
          "description": "Cold coffee brewed from roasted beans...",
          "quantity": 0,
          "isFav": false,
          "price": "30",
        },
      ]
    };

    return Scaffold(
      backgroundColor: Colors.white10,
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: screenWidth * 0.02, horizontal: screenWidth * 0.04),
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.menu, size: 35, color: Colors.white.withOpacity(0.2)),
                ),
                IconButton(
                  onPressed: () {
                    Get.to( CartView());
                  },
                  icon: Icon(Icons.shopping_cart, size: 35, color: Colors.white.withOpacity(0.2)),
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "It's a greate Day for coffe",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
                )
              ],
            ),
            SizedBox(height: screenHeight * 0.02),
            const TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white10,
                prefixIcon: Icon(Icons.search),
                hintText: 'Find your coffee',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),

            Obx(() {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TabBarItem(
                    screenWidth: screenWidth,
                    title: 'Home',
                    isSelected: controller.currentIndex.value == 0,
                    onTap: () => controller.changeIndex(val: 0),
                  ),
                  TabBarItem(
                    screenWidth: screenWidth,
                    title: 'Cold Coffee',
                    isSelected: controller.currentIndex.value == 1,
                    onTap: () => controller.changeIndex(val: 1),
                  ),
                  TabBarItem(
                    screenWidth: screenWidth,
                    title: 'Cappuccino',
                    isSelected: controller.currentIndex.value == 2,
                    onTap: () => controller.changeIndex(val: 2),
                  ),
                ],
              );
            }),

            SizedBox(height: screenHeight * 0.02),

            Obx(() {
              if (controller.currentIndex.value == 0) {
                return Expanded(
                  child: GridView.builder(
                    itemCount: fakeData['data']?.length ?? 0,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: screenHeight * 0.02,
                      crossAxisSpacing: screenWidth * 0.05,
                      childAspectRatio: 0.7,
                    ),
                    itemBuilder: (context, index) {
                      final item = fakeData['data']![index];
                      return CoffeeItem(
                        screenWidth: screenWidth,
                        screenHeight: screenHeight,
                        onTap: () {
                          Get.to(
                            CoffeeView(
                              coffee: Coffee(
                                title: item['title'] as String,
                                image: item['image'] as String,
                                description: item['description'] as String,
                                subTitle: item['subTitle'] as String,
                                price: double.parse(item['price'] as String),
                              ),
                            ),
                          );
                        },
                        title: item['title'] as String,
                        image: item['image'] as String,
                        description: item['description'] as String,
                        subTitle: item['subTitle'] as String,
                        price: double.parse(item['price'] as String),
                      );
                    },
                  ),
                );
              } else if (controller.currentIndex.value == 1) {
                return const Expanded(
                  child: Center(
                    child: Text('Cold Coffee', style: TextStyle(color: Colors.white)),
                  ),
                );
              } else {
                return const Expanded(
                  child: Center(
                    child: Text('Cappuccino', style: TextStyle(color: Colors.white)),
                  ),
                );
              }
            }),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white12,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.orange,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: currentIndex,
        onTap: (val) {
          setState(() {
            currentIndex = val;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.library_add), label: 'Library'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
class CoffeeItem extends StatelessWidget {
  const CoffeeItem({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.onTap,
    required this.title,
    required this.image,
    required this.description,
    required this.subTitle,
    required this.price,
  });

  final double screenWidth;
  final double screenHeight;
  final VoidCallback onTap;
  final String title;
  final String image;
  final String description;
  final String subTitle;
  final double price;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: screenWidth * 0.4,
        height: screenHeight * 0.26,
        decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(16),
        ),
        padding: EdgeInsets.all(
          screenWidth * 0.02,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              image,
              height: screenHeight * 0.12,
              width: screenWidth * 0.35,
            ),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              subTitle,
              style: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "$price \$",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                CircleAvatar(
                  radius: screenWidth * 0.05,
                  backgroundColor: Colors.orange,
                  child: IconButton(
                    onPressed: onTap,
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class TabBarItem extends StatelessWidget {
  const TabBarItem({
    super.key,
    required this.screenWidth,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  final double screenWidth;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              color: isSelected ? Colors.orange : Colors.white.withOpacity(0.2),
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            width: screenWidth * 0.25,
            height: 3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: isSelected ? Colors.orange : Colors.transparent,
            ),
          )
        ],
      ),
    );
  }
}

