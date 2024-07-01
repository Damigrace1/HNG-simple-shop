import 'package:flutter/Material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:untitled2/controller/products.dart';
import 'package:untitled2/models/product.dart';

import '../../../main.dart';
import '../../../utils.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({Key? key, required this.product, this.height})
      : super(key: key);
  final Product product;
  final double? height;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: CupertinoColors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(spreadRadius: 1, blurRadius: 4, color: Colors.grey)
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 100, child: Image.asset(widget.product.image ?? '')),
          Text(
            widget.product.name ?? '',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            widget.product.desc ?? '',
            style: TextStyle(fontSize: 14, color: Colors.grey),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${widget.product.unitPrice}' ?? '',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              InkWell(
                  splashColor: Colors.transparent,
                  onTap: (){
                    if(cartItems.contains(widget.product))return;
                    setState(() {
                      cartItems.add(widget.product);
                    });
                    showSnackBar(context, 'Item added to cart');
                  },
                  child: Icon(CupertinoIcons.cart_badge_plus))
            ],
          )
        ],
      ),
    );
  }
}



