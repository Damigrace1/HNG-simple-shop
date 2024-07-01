import 'package:flutter/Material.dart';

import 'controller/products.dart';
import 'main.dart';
import 'models/product.dart';

void showSnackBar(BuildContext context, String message) {
  final scaffoldMessenger = ScaffoldMessenger.of(context);
  final snackBar = SnackBar(
    content: Row(
      mainAxisSize: MainAxisSize.min, // Center content horizontally
      children: [
        Text(message),
      ],
    ),
    backgroundColor: Colors.grey.shade800, // Optional background color
    elevation: 6.0, // Optional elevation for a shadow effect
    duration: const Duration(seconds: 3), // Optional duration for auto-dismiss
  );
 scaffoldMessenger.showSnackBar(snackBar);

}

double getGross() {
  double total = 0;
  for (Product product in cartItems) {
    total += product.quantity*int.parse(product.unitPrice?.replaceAll(',', '')??'1');
  }
  return total;
}