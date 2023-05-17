import 'package:flutter/material.dart';
class TextTitleContainer extends StatelessWidget {

 final String title;
 final EdgeInsets edgeInsets;
 final Function() onPress;

 TextTitleContainer({Key? key,required this.title, required this.edgeInsets, required this.onPress,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: edgeInsets,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,style: TextStyle(color:Color(0xFF434343),fontSize: 18),),
          TextButton(
            onPressed: onPress,
            child: Text('see all'),
          ),
        ],
      ),
    );
  }
}
