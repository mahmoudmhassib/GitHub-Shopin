import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_in/api_actions/provider_models.dart';
import 'package:shop_in/cart_card.dart';

import '../app_bar.dart';
import '../button.dart';

class MyCart extends StatefulWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
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
              margin: EdgeInsets.only(left: 10, bottom: 15),
              child: Text(
                'Cart',
                style: TextStyle(color: Color(0xFF434343), fontSize: 30),
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  ListView.builder(
                      itemCount: 6,
                      itemBuilder: (ctx, index) {
                        //TODO: add
                        return CartCard();
                      }),
                  Positioned(
                    bottom: 20,
                    right: 20,
                    left: 20,
                    child: ButtonPress(
                      onClick: () {},
                      text: 'Continue'.toUpperCase(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
