import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/city_controller.dart';
import '../model/city_model.dart';
import 'detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Widget buildChip(String label, bool isSelected) {
    return GestureDetector(
      onTap: () {
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        margin: const EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.grey[200] : Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Text(
          label,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CityController>();

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    margin: const EdgeInsets.all(15),
                    child: IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {},
                    ),
                  ),
                  const Row(
                    children: [
                      Icon(Icons.pin_drop_rounded, color: Colors.red),
                      SizedBox(width: 8),
                      Text(
                        "Explore",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    margin: const EdgeInsets.all(15),
                    child: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),


              SizedBox(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.cities.length,
                  itemBuilder: (context, index) {
                    final city = controller.cities[index];
                    return GestureDetector(
                      onTap: () {
                        controller.selectCity(city);
                        Get.to(() => const DetailScreen());
                      },
                      child: Container(
                        width: 120,
                        margin: const EdgeInsets.only(right: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                            image: AssetImage(city.imagePath),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.transparent,
                                    Colors.black.withOpacity(0.7),
                                  ],
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  city.name,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const Positioned(
                              top: 10,
                              right: 10,
                              child: Icon(
                                Icons.bookmark_border,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 16),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    buildChip("Best Places", true),
                    buildChip("Most Visited", false),
                    buildChip("Favourites", false),
                    buildChip("New", false),
                  ],
                ),
              ),

              const SizedBox(height: 24),


              Expanded(
                child: ListView.builder(
                  itemCount: controller.cities.length,
                  itemBuilder: (context, index) {
                    final city = controller.cities[index];
                    return GestureDetector(
                      onTap: () {
                        controller.selectCity(city);
                        Get.to(() => const DetailScreen());
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 150,
                            margin: const EdgeInsets.only(bottom: 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              image: DecorationImage(
                                image: AssetImage(city.imagePath),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.transparent,
                                    Colors.black.withOpacity(0.5),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                city.name,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.star,
                                      color: Colors.amber, size: 18),
                                  Text(
                                    "${city.rating}",
                                    style: const TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    );
                  },
                ),
              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: const Icon(Icons.person_outline),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.favorite_border),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.home),
                    color: Colors.blue,
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.location_on_outlined),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.list),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
