import 'package:flutter/material.dart';
import 'package:shop_in/screens/login_screen.dart';

import '../button.dart';
import '../text_field.dart';
import '../text_field_password.dart';
class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    void _onPress(){
      Navigator.of(context).pop();
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body:  SafeArea(
        child: SingleChildScrollView(
          padding:const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: _onPress,
                    child: Icon(
                      Icons.arrow_back_sharp,
                    ),
                  ),
                  const SizedBox(height: 10.0,),
                  const Text(
                    'Signup',
                    style: TextStyle(
                      color: Color(0xFF323232),
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50.0,),
              Column(
                children: [
                  TextFieldInput(
                    hintTitle: 'Name',
                    lableTitle: 'Name',
                  ),
                  TextFieldInput(
                    hintTitle: 'Email',
                    lableTitle: 'Email',
                  ),
                  TextFieldPassword(),
                ],
              ),
             const SizedBox(height:80.0,),
              Column(
                children: [
                  Center(
                    child: ButtonPress(
                      text: 'Sign Up',
                      onClick: () {},
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                    const  Text(
                        'Already have an account?',
                        style: TextStyle(
                          color: Color(0xFFA3A3A3),
                          fontSize: 14,
                        ),
                      ),
                      TextButton(
                        onPressed: (){},
                        child:const Text(
                          'Sign in',
                          style: TextStyle(
                            color: Color(0xFF3C3C3C),
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
