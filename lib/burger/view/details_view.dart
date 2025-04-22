import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/burger_model.dart';
import '../providers/cart_provider.dart';
import 'cart_view.dart';

class DetailsScreen extends StatefulWidget {
  final BurgerModel burger;

  const DetailsScreen({super.key, required this.burger});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final burgerToShow = widget.burger;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context, screenWidth, screenHeight),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildBurgerImage(burgerToShow, screenWidth, screenHeight),
                    _buildBurgerDetails(
                        burgerToShow, screenWidth, screenHeight),
                  ],
                ),
              ),
            ),
            _buildBuyButton(context, burgerToShow, screenWidth, screenHeight),
          ],
        ),
      ),
    );
  }

  Padding _buildHeader(
      BuildContext context, double screenWidth, double screenHeight) {
    final cart = Provider.of<CartProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.04, vertical: screenHeight * 0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          Stack(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.shopping_cart_outlined,
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
        ],
      ),
    );
  }

  Widget _buildBurgerImage(
      BurgerModel burger, double screenWidth, double screenHeight) {
    return SizedBox(
      height: screenHeight * 0.37,
      width: double.infinity,
      child: Image.asset(
        burger.image,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) {
          return Image.network(
            'https://via.placeholder.com/400',
            fit: BoxFit.contain,
          );
        },
      ),
    );
  }

  Widget _buildBurgerDetails(
      BurgerModel burger, double screenWidth, double screenHeight) {
    return Padding(
      padding: EdgeInsets.all(screenWidth * 0.04),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: screenWidth * 0.3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: screenWidth * 0.5,
                  child: Text(
                    burger.name,
                    style: TextStyle(
                      fontSize: screenWidth * 0.06,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                SizedBox(
                  width: screenWidth * 0.55,
                  child: Text(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    burger.info,
                    style: const TextStyle(
                      color: Colors.grey,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
          _buildQuantitySelector(screenWidth, screenHeight),
        ],
      ),
    );
  }

  Widget _buildQuantitySelector(double screenWidth, double screenHeight) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
      child: Row(
        children: [
          Container(
            width: screenWidth * 0.12,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(screenWidth * 0.038)),
            child: IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () {
                if (quantity > 1) {
                  setState(() {
                    quantity--;
                  });
                }
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.038),
            child: Text(
              '$quantity',
              style:
                  TextStyle(fontSize: screenWidth * 0.055, color: Colors.white),
            ),
          ),
          Container(
            width: screenWidth * 0.12,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(screenWidth * 0.038)),
            child: IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                setState(() {
                  quantity++;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBuyButton(BuildContext context, BurgerModel burger,
      double screenWidth, double screenHeight) {
    return Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(
            children: [
              Text(
                'Total Price',
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  color: Colors.grey,
                ),
              ),
              Text(
                '\$${(burger.price * quantity).toStringAsFixed(0)}',
                style: TextStyle(
                    fontSize: screenWidth * 0.06,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              for (int i = 0; i < quantity; i++) {
                Provider.of<CartProvider>(context, listen: false)
                    .addToCart(burger);
              }
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('$quantity ${burger.name}(s) added to cart'),
                  duration: const Duration(seconds: 1),
                ),
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartScreen(),
                ),
              );
            },
            child: Container(
              width: screenWidth * 0.38,
              height: screenHeight * 0.087,
              decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(screenWidth * 0.038),
                    bottomRight: Radius.circular(screenWidth * 0.038),
                    topRight: Radius.circular(screenWidth * 0.038),
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.shopping_cart),
                  SizedBox(width: screenWidth * 0.02),
                  Text(
                    'Buy Now',
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]));
  }
}
