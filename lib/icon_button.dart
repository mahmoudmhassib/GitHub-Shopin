import 'package:flutter/material.dart';
class IconButtonDesign extends StatelessWidget {
  final IconData icon;
  final Function() onPress;
   IconButtonDesign({Key? key,required this.icon ,required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPress,
        icon: Icon(icon),
    );
  }
}
