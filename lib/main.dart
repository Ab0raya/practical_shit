// travel main

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practical_shit/travel/view/welcome_screen.dart';

import 'travel/controller/city_controller.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Travel App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialBinding: BindingsBuilder(() {
        Get.put(CityController());
      }),
      home: const WelcomeScreen(),
    );
  }
}


// coffee main
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:practical_shit/coffee/view/splahs_view.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const SplashView(),
//     );
//   }
// }

// burger main :

//
// import 'package:flutter/material.dart';
// import 'package:practical_shit/burger/view/home_view.dart';
// import 'package:practical_shit/burger/view/welcome_screen.dart';
// import 'package:provider/provider.dart';
// import 'burger/model/cart_provider.dart';
//
// void main() {
//
//   return runApp(
//     const MyApp(),
//   );
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//         scaffoldBackgroundColor: const Color(0xff232327)
//       ),
//       home: const WelcomeScreen(),
//     );
//   }
// }
//
//
//
