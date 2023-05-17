import 'package:flutter/material.dart';
class ButtonPress extends StatelessWidget {
  late String text;
  final Function() onClick;
   ButtonPress({Key? key,required this.text,required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onClick,
      child: Container(
        width: MediaQuery.of(context).size.width*.78,
        height: 50,
        decoration:  BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 3,
              offset:const Offset(0, 5),
              spreadRadius: 2,
            ),

          ],
          gradient:const LinearGradient(
            colors: [
              Color(0xFF667EEA),
              Color(0xFF64B6FF),
            ],
            stops: [0,225],
          ),
        ),
        child: Center(
          child: Text(
            text,
            style:const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
