import 'package:flutter/material.dart';
import 'package:practical_shit/burger/model/cart_item.dart';
import 'package:provider/provider.dart';


import '../providers/cart_provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          'My Cart',
          style: TextStyle(
              color: Colors.white,
              fontSize: screenWidth * 0.05
          ),
        ),
        backgroundColor: const Color(0xff232327),
        elevation: 0,
      ),
      body: cart.items.isEmpty
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.shopping_cart_outlined,
              size: screenWidth * 0.25,
              color: Colors.amber,
            ),
            SizedBox(height: screenHeight * 0.02),
            Text(
              'Your cart is empty',
              style: TextStyle(
                fontSize: screenWidth * 0.045,
                color: Colors.amber,
              ),
            ),
          ],
        ),
      )
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                final item = cart.items.values.elementAt(index);
                return _buildCartItem(context, item, cart, screenWidth, screenHeight);
              },
            ),
          ),
          _buildCartSummary(context, cart, screenWidth, screenHeight),
        ],
      ),
    );
  }

  Widget _buildCartItem(
      BuildContext context, CartItem item, CartProvider cart, double screenWidth, double screenHeight) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.04,
          vertical: screenHeight * 0.01
      ),
      padding: EdgeInsets.all(screenWidth * 0.04),
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
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(screenWidth * 0.02),
            child: Image.asset(
              item.burger.image,
              width: screenWidth * 0.2,
              height: screenWidth * 0.2,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Image.network(
                  'https://via.placeholder.com/80',
                  width: screenWidth * 0.2,
                  height: screenWidth * 0.2,
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          SizedBox(width: screenWidth * 0.04),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.burger.name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: screenWidth * 0.04,
                      color: Colors.white),
                ),
                Text(
                  '\$${item.burger.price.toStringAsFixed(0)}',
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: screenWidth * 0.035,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove_circle_outline),
                onPressed: () {
                  cart.removeFromCart(item.burger);
                },
              ),
              Text(
                '${item.quantity}',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              IconButton(
                icon: const Icon(Icons.add_circle_outline),
                onPressed: () {
                  cart.addToCart(item.burger);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCartSummary(BuildContext context, CartProvider cart, double screenWidth, double screenHeight) {
    return Container(
      padding: EdgeInsets.all(screenWidth * 0.04),
      decoration: BoxDecoration(
        color: const Color(0xFF232327),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(screenWidth * 0.06),
          topRight: Radius.circular(screenWidth * 0.06),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: screenWidth * 0.0025,
            blurRadius: screenWidth * 0.025,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Price',
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  color: Colors.grey,
                ),
              ),
              Text(
                '\$${cart.totalPrice.toStringAsFixed(0)}',
                style: TextStyle(
                    fontSize: screenWidth * 0.06,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber),
              ),
            ],
          ),
          SizedBox(height: screenHeight * 0.02),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                foregroundColor: Colors.black,
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(screenWidth * 0.02),
                ),
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Order placed successfully!'),
                    duration: Duration(seconds: 2),
                  ),
                );
                cart.clearCart();
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: Text(
                'Place Order',
                style: TextStyle(
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


