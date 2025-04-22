import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/burger_model.dart';
import '../providers/cart_provider.dart';
import 'cart_view.dart';
import 'details_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedCategoryIndex = 0;
  final List<String> _categories = [
    'Burger',
    'Pizza',
    'Cheese',
    'Pasta',
  ];
  final List<BurgerModel> burgers = [
    BurgerModel(
      name: 'Double Cheese Burger',
      image: 'assets/burger/1.png',
      info: 'Double the beef, double the cheese, double the satisfaction.',
      price: 55,
    ),
    BurgerModel(
      name: 'Veggie Burger',
      image: 'assets/burger/2.png',
      info: 'A delicious vegetarian option with all the flavors you love.',
      price: 55,
    ),
    BurgerModel(
      name: 'BBQ Burger',
      image: 'assets/burger/3.png',
      info: 'Juicy burger with our special BBQ sauce and fresh ingredients.',
      price: 55,
    ),
    BurgerModel(
      name: 'Hot & Fresh Burger',
      image: 'assets/burger/4.png',
      info: 'Premium burger with all fresh ingredients and our special sauce.',
      price: 100,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAppBar(screenWidth, screenHeight),
            _buildHeader(screenWidth, screenHeight),
            _buildCategories(screenWidth, screenHeight),
            Expanded(
              child: _buildProductGrid(screenWidth, screenHeight),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context, screenWidth, screenHeight),
    );
  }

  Padding _buildAppBar(double screenWidth, double screenHeight) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.04,
          vertical: screenHeight * 0.01
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.menu,
            color: Colors.white,
          ),
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Padding _buildHeader(double screenWidth, double screenHeight) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.04,
          vertical: screenHeight * 0.01
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Hot & Fast Food',
            style: TextStyle(
              fontSize: screenWidth * 0.06,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            'Delivers on Time',
            style: TextStyle(
              fontSize: screenWidth * 0.035,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Container _buildCategories(double screenWidth, double screenHeight) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.015),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            _categories.length,
                (index) => Padding(
              padding: EdgeInsets.only(
                left: index == 0 ? screenWidth * 0.04 : screenWidth * 0.02,
                right: index == _categories.length - 1 ? screenWidth * 0.04 : screenWidth * 0.02,
              ),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedCategoryIndex = index;
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.04,
                      vertical: screenHeight * 0.01
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: _selectedCategoryIndex == index
                            ? Colors.amber
                            : Colors.transparent,
                        width: 2,
                      ),
                    ),
                  ),
                  child: Text(
                    _categories[index],
                    style: TextStyle(
                      color: _selectedCategoryIndex == index
                          ? Colors.amber
                          : Colors.grey,
                      fontWeight: _selectedCategoryIndex == index
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProductGrid(double screenWidth, double screenHeight) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.04,
          vertical: screenHeight * 0.01
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: screenWidth * 0.04,
        mainAxisSpacing: screenHeight * 0.02,
      ),
      itemCount: burgers.length,
      itemBuilder: (context, index) {
        return _buildProductCard(context, burgers[index], screenWidth, screenHeight);
      },
    );
  }

  Widget _buildProductCard(BuildContext context, BurgerModel burger, double screenWidth, double screenHeight) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsScreen(burger: burger),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: Offset(0, screenHeight * 0.0025),
                blurRadius: screenWidth * 0.038,
                spreadRadius: screenWidth * 0.025)
          ],
          color: const Color(0xFF232327),
          borderRadius: BorderRadius.circular(screenWidth * 0.03),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Center(
                child: Image.asset(
                  burger.image,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.network(
                      'https://via.placeholder.com/150',
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    burger.name,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth * 0.04,
                        color: Colors.white),
                  ),
                  Text(
                    'Hot Burger',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: screenWidth * 0.03,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$${burger.price.toStringAsFixed(0)}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: screenWidth * 0.04,
                            color: Colors.white),
                      ),
                      IconButton(
                        icon: const Icon(Icons.shopping_cart_outlined),
                        onPressed: () {
                          Provider.of<CartProvider>(context, listen: false)
                              .addToCart(burger);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('${burger.name} added to cart'),
                              duration: const Duration(seconds: 1),
                            ),
                          );
                        },
                        constraints: BoxConstraints(),
                        padding: EdgeInsets.zero,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context, double screenWidth, double screenHeight) {
    final cart = Provider.of<CartProvider>(context);

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: Offset(0, screenHeight * 0.0025),
              blurRadius: screenWidth * 0.038,
              spreadRadius: screenWidth * 0.025)
        ],
        color: const Color(0xFF232327),
        border: const Border(
          top: BorderSide(
            color: Colors.amber,
            width: 0.2,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const IconButton(
              icon: Icon(Icons.email_outlined, color: Colors.white),
              onPressed: null,
            ),
            const IconButton(
              icon: Icon(Icons.favorite_border, color: Colors.white),
              onPressed: null,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.amber,
                shape: BoxShape.circle,
              ),
              margin: EdgeInsets.all(screenWidth * 0.025),
              child: Stack(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CartScreen(),
                        ),
                      );
                    },
                  ),
                  if (cart.itemCount > 0)
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        padding: EdgeInsets.all(screenWidth * 0.005),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        constraints: BoxConstraints(
                          minWidth: screenWidth * 0.04,
                          minHeight: screenWidth * 0.04,
                        ),
                        child: Text(
                          '${cart.itemCount}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth * 0.025,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            const IconButton(
              icon: Icon(Icons.notifications_outlined, color: Colors.white),
              onPressed: null,
            ),
            const IconButton(
              icon: Icon(Icons.person_outline, color: Colors.white),
              onPressed: null,
            ),
          ],
        ),
      ),
    );
  }
}
