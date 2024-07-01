import 'package:flutter/Material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../utils.dart';
import '../checkout_page.dart';

class CartPageFooter extends StatelessWidget {
  const CartPageFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: Colors.red,
        // borderRadius: BorderRadius.only(
        //   topLeft: Radius.circular(10,),
        //   topRight: Radius.circular(10,)
        // )
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(child: SizedBox()),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Text('Subtotal',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,
                  color: Colors.white),),
                  Text('\$ ${getGross()}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22,
                  color: Colors.white))
                ],),
            ),
            Flexible(
              child: SizedBox(
                height: 15,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Colors.white
                    )
                ),
                onPressed: () {
                  Navigator.push(context, CupertinoPageRoute(builder: (context)=>
                      CheckoutPage()));
                },
                child: Text('Checkout',style: TextStyle(
                    color: Colors.red
                ),),
              ),
            ),
            Flexible(
              child: SizedBox(
                height: 10,
              ),
            )
          ],
        ),
      ),
    );
  }
}