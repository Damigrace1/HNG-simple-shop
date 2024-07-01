import 'package:flutter/material.dart';
import 'package:untitled2/views/products/cart_page.dart';
import 'package:untitled2/views/products/components/cart_items_icon.dart';
import 'package:untitled2/views/products/products_list.dart';

import 'models/product.dart';

void main() {
  runApp(const MyApp());
}

int selectedTab = 0;
List<Product> cartItems = [];

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static final  List<Widget> _screens = [
    ProductsList(),
    CartPage()
  ];

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(

        body: MyApp._screens[selectedTab],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.shop),label: "Products"),
            BottomNavigationBarItem(
                icon: CartItemsIcon(),
              label: 'Cart'
            )
          ],
          currentIndex: selectedTab,
          selectedItemColor: Colors.deepOrange,
          onTap: (index){
            setState(() {
              selectedTab = index;
            });
          },

      ),
      ),
    );
  }
}

