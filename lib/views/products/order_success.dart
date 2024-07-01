import 'package:flutter/Material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/main.dart';

import '../../controller/products.dart';
import '../../utils.dart';

class OrderSuccess extends StatelessWidget {
  const OrderSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0,
        toolbarHeight: 50,
        title:      Text(
          'Order Successful',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: SizedBox(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Theme.of(context).primaryColor.withOpacity(0.1)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Align(alignment: Alignment.center,child:
                   Icon(CupertinoIcons.check_mark_circled,size: 90,
                   color: Colors.green,)),
                  SizedBox(height: 32,),
                  ListView.separated(

                    itemBuilder: (BuildContext context, int index) {
                      return  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width:150,
                            child: Text(cartItems[index].name??'',style: TextStyle(
                                fontSize: 14,color: Colors.grey,fontWeight: FontWeight.bold
                            ),maxLines: 1, overflow: TextOverflow.ellipsis,),
                          ),
                          Text('\$ ${int.parse(cartItems[index].unitPrice?.replaceAll(',', '')??'0')
                              * cartItems[index].quantity }',style: TextStyle(
                              fontSize: 14,color: Colors.grey,fontWeight: FontWeight.bold
                          )),
                        ],
                      );
                    },
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: cartItems.length, separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(height: 16,);
                  },),
                  SizedBox(height: 16,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width:150,
                        child: Text('Shipping',style: TextStyle(
                            fontSize: 14,color: Colors.grey,fontWeight: FontWeight.bold
                        ),maxLines: 1, overflow: TextOverflow.ellipsis,),
                      ),
                      Text('\$ 3,000',style: TextStyle(
                          fontSize: 14,color: Colors.grey,fontWeight: FontWeight.bold
                      )),
                    ],
                  ),
                  SizedBox(height: 16,),
                  Divider(),
                  SizedBox(height: 16,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width:150,
                        child: Text('Total Price',style: TextStyle(
                            fontSize: 16,fontWeight: FontWeight.bold
                        ),maxLines: 1, overflow: TextOverflow.ellipsis,),
                      ),
                      Text('\$ ${getGross() + 3000}',style: TextStyle(
                          fontSize: 14,color: Colors.grey,fontWeight: FontWeight.bold
                      )),
                    ],
                  ),
                  SizedBox(height: 30,),
                ],),
            ),
            SizedBox(height: 16,),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: (){}, child: Text(
                  'Track Order',
                style: TextStyle(color: Colors.deepOrange),
                  ),
              style: ButtonStyle(
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                  )
                )
              ),),
            )
          ],
        ),
      ),
    );
  }
}
