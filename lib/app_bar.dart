import 'package:flutter/material.dart';

import 'icon_button.dart';
class AppBarToScreen extends StatelessWidget {
  final IconData icon1;
  final IconData icon2;
  final IconData icon3;
  final Function() onClick1;
  final Function() onClick2;
  final Function() onClick3;
  const AppBarToScreen({Key? key,  required this.icon1, required this.icon2, required this.icon3, required this.onClick1, required this.onClick2, required this.onClick3}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.only(bottom: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButtonDesign(
            onPress: onClick1,
            icon: icon1,
          ),
          Row(
            children: [
              IconButtonDesign(
                  icon: icon2,
                  onPress: onClick2,
              ),
              IconButtonDesign(
                  icon: icon3,
                  onPress: onClick3
              ),
            ],
          ),
        ],
      ),
    );
  }
}
