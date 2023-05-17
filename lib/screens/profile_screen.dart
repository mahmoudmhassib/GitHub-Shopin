import 'package:flutter/material.dart';

import '../app_bar.dart';
import '../text_field.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

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
                'Profile',
                style: TextStyle(color: Color(0xFF434343), fontSize: 30),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  buildContainerTextField('Name','Name'),
                  buildContainerTextField('Address Lane','Address Lane'),
                  buildContainerTextField('City','City'),
                  buildContainerTextField('Gender','Gender'),
                  buildContainerTextField('Email','Email'),
                  buildContainerTextField('Phone Namber','Phone Namber'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildContainerTextField(String hint ,String lable) {
    return Container(
            margin: EdgeInsets.symmetric(horizontal: 25,vertical: 10),
              child: TextFieldInput(hintTitle: hint,lableTitle: lable,));
  }
}
