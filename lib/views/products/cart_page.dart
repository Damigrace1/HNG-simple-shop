import 'dart:ui';

import 'package:flutter/Material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled2/controller/products.dart';
import 'package:untitled2/main.dart';
import 'package:untitled2/models/product.dart';
import 'package:untitled2/views/products/checkout_page.dart';

import '../../utils.dart';
import 'components/cart_page_footer.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          'My Cart',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        elevation: 3,
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: cartItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 130,
                      child: Stack(
                        children: [
                          Positioned.fill(
                              child: Container(
                            margin:
                                EdgeInsets.only(top: 10, bottom: 10, left: 30),
                            padding:
                                EdgeInsets.only(top: 10, bottom: 10, left: 120),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      blurRadius: 4)
                                ]),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        cartItems[index].name ?? '',
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        cartItems[index].name ?? '',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '\$ ${cartItems[index].unitPrice}',
                                            style: TextStyle(
                                                color: Colors.deepOrange,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Row(
                                            children: [
                                              CustomIconButton(
                                                iconData: CupertinoIcons.minus,
                                                onTap: () {
                                                  if (cartItems[index]
                                                          .quantity ==
                                                      0) return;
                                                  setState(() {
                                                    cartItems[index].quantity -=
                                                        1;
                                                  });
                                                },
                                              ),
                                              SizedBox(
                                                width: 4,
                                              ),
                                              Text(
                                                cartItems[index]
                                                    .quantity
                                                    .toString(),
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                width: 4,
                                              ),
                                              CustomIconButton(
                                                iconData: CupertinoIcons.plus,
                                                onTap: () {
                                                  setState(() {
                                                    cartItems[index].quantity +=
                                                        1;
                                                  });
                                                },
                                              )
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                )
                              ],
                            ),
                          )),
                          Positioned(
                              right: 0,
                              child: InkWell(
                                  onTap:(){
                      setState(() {
                        cartItems.remove(cartItems[index]);
                      });
                    },
                                  child: Icon(CupertinoIcons.delete))),
                          Positioned(
                              left: 0,
                              child: Container(
                                height: 130,
                                width: 130,
                                child: Image.asset(products[index].image ?? ''),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          blurRadius: 4,
                                          spreadRadius: 2)
                                    ]),
                                padding: EdgeInsets.all(20),
                              )),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      height: 20,
                    );
                  },
                ),
                SizedBox(
                  height: 150,
                ),
              ],
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: CartPageFooter())
        ],
      ),
    ));
  }
}

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    this.onTap,
    required this.iconData,
  });
  final Function()? onTap;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Icon(
          iconData,
          size: 18,
        ));
  }
}
