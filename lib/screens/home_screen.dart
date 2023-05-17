import 'package:flutter/material.dart';

import '../button.dart';
import 'login_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: Column(
                children: [
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: 'Welcome to',
                        style: TextStyle(
                          color: Color(0xFF707070),
                          fontSize: 20,
                          fontFamily: 'lib/fonts/Segoe UI.ttf',
                        ),
                      ),
                      TextSpan(
                        text: 'Bolt',
                        style: TextStyle(
                          color: Color(0xFF707070),
                          fontSize: 22,
                          fontFamily: 'lib/fonts/Segoe UI.ttf',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
                  ),
                  Text(
                    'Explore Us',
                    style: TextStyle(
                      color: Color(0xFF707070),
                      fontSize: 18,
                      fontFamily: 'lib/fonts/Segoe UI.ttf',
                    ),
                  ),
                ],
              ),
            ),
           const Image(
              image: AssetImage('lib/images/homescreen/Image.png'),
              width: 340,
              height: 216,
              fit: BoxFit.cover,
            ),
           const SizedBox(height: 20),
           Container(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 ButtonPress(
                   text: 'Log in',
                   onClick: (){

                     Navigator.of(context).push(MaterialPageRoute(builder: (_)=>LoginScreen()));
                     print(',mmnnnjbhgvhg');
                   },
                 ),
                 const SizedBox(height: 15),
                 Center(
                   child: TextButton(
                     onPressed: (){},
                     child:const Text(
                       'Signup',
                       style: TextStyle(
                         color: Color(0xFF454242),
                         fontSize: 16,
                         fontWeight: FontWeight.normal,
                       ),
                     ),
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
