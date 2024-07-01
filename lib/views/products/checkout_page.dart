import 'package:flutter/Material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/controller/products.dart';
import 'package:untitled2/main.dart';
import 'package:untitled2/views/products/order_success.dart';

import '../../utils.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Checkout',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        elevation: 3,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24,vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Ship To',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
            SizedBox(height: 8,),
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
                Text('Erima Street, Omoku, River State',style: TextStyle(
                  color: Colors.deepOrange, fontWeight: FontWeight.bold,fontSize: 16
                ),),
                SizedBox(height: 12,),
                Text('Damilare Ogunwehin\n08106052329',style: TextStyle(fontWeight: FontWeight.bold
                ),),
              ],),
            ),
            SizedBox(height: 16,),
            Text('Pay with',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
            SizedBox(height: 8,),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Theme.of(context).primaryColor.withOpacity(0.1)
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 8,
                    backgroundColor: Colors.deepOrange,
                    child: CircleAvatar(
                      radius: 6,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 4,
                        backgroundColor: Colors.deepOrange,
                      ),
                    ),
                  ),
                  SizedBox(width: 12,),
                  Image.asset('assets/images/products/paypal.jpg',width: 30,),
                  SizedBox(width: 12,),
                  Text('Paypal',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                ],
              ),
            ),
            SizedBox(height: 16,),
            Text('Summmary',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
            SizedBox(height: 8,),
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
                        child: Text('SubTotal',style: TextStyle(
                            fontSize: 16,fontWeight: FontWeight.bold
                        ),maxLines: 1, overflow: TextOverflow.ellipsis,),
                      ),
                      Text('\$ ${getGross() + 3000}',style: TextStyle(
                          fontSize: 14,color: Colors.grey,fontWeight: FontWeight.bold
                      )),
                    ],
                  ),
                  SizedBox(height: 30,),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Colors.deepOrange
                          )
                      ),
                      onPressed: () {
                        Navigator.push(context, CupertinoPageRoute(builder: (context)=>
                            OrderSuccess()));
                      },
                      child: Text('Pay',style: TextStyle(
                          color: Colors.white
                      ),),
                    ),
                  ),
                ],),
            ),
          ],
        ),
      ),
    );
  }
}
