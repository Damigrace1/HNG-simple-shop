import 'package:flutter/Material.dart';
import 'package:flutter/cupertino.dart';
import 'package:untitled2/utils.dart';

import '../../../main.dart';

class CartItemsIcon extends StatelessWidget {
  const CartItemsIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  InkWell(
     splashColor: Colors.transparent,
      customBorder: const CircleBorder(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child:
        Center(
          child: Stack(
            children: [
              Icon(CupertinoIcons.cart),
                // Positioned(
                //     right: 0,
                //     child: CircleAvatar(
                //       radius: 7,
                //       backgroundColor: Colors.deepOrange,
                //       child: Center(child:Text(cartItems.length.toString(),
                //       style: TextStyle(fontSize: 10,color: Colors.white),)),
                //     ))
            ],
          ),
        ),
      ),
    );
  }
}