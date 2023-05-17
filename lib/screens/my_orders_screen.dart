import 'package:flutter/material.dart';

import '../app_bar.dart';
import '../button.dart';
class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBarToScreen(
              icon1: Icons.arrow_back,
              onClick1: () {
                Navigator.of(context).pop();
              },
              icon2: Icons.search,
              onClick2: () {},
              icon3: Icons.delete,
              onClick3: () {},
            ),
            Container(
              margin: EdgeInsets.only(left: 20, bottom: 15),
              child: Text(
                'My Order',
                style: TextStyle(color: Color(0xFF434343), fontSize: 30),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (ctx,index){
                    return  Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13),
                      ),
                      elevation: 20,
                      margin: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.all(20),
                                  width: 100,
                                  height: 105,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        'lib/images/features/Mask Group 4.png',
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Women t-shirt',style: TextStyle(color: Color(0xFF434343),fontSize: 16),),
                                    SizedBox(height: 3,),
                                    Text('Lotto. LTD',style: TextStyle(color: Color(0xFF919191),fontSize: 16),),
                                    SizedBox(height: 4,),
                                    Text('\$34.00 ',style: TextStyle(color: Color(0xFF374ABE),fontSize: 16),),
                                    SizedBox(height: 4,),
                                    Container(
                                      width:115,
                                        height: 40,
                                        child: ButtonPress(text: 'Order Again',onClick: (){},)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
