import 'package:flutter/material.dart';
class TextFieldInput extends StatelessWidget {
  String hintTitle;
  String lableTitle;
   TextFieldInput({Key? key,required this.hintTitle,required this.lableTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controll=TextEditingController();
    return TextField(
      controller:_controll ,
      decoration: InputDecoration(
        hintText: hintTitle,
        labelText: lableTitle,
      ),
    );
  }
}
