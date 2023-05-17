import 'package:flutter/material.dart';
class TextFieldPassword extends StatefulWidget {
  const TextFieldPassword({Key? key}) : super(key: key);

  @override
  State<TextFieldPassword> createState() => _TextFieldPasswordState();
}

class _TextFieldPasswordState extends State<TextFieldPassword> {
  bool _visible=true;
  visiblePass(){
     setState(() {
       _visible=!_visible;
     });
  }
  final _controll=TextEditingController();
  @override
  Widget build(BuildContext context) {

    return TextField(
      controller: _controll,
      obscureText: _visible,
      decoration: InputDecoration(
        hintText: 'Password',
        labelText: 'Password',
        suffixIcon: IconButton(
          icon: _visible==true?Icon(Icons.visibility_off_sharp):Icon(Icons.visibility),
          onPressed: visiblePass,
        ),
      ),
    );
  }
}
