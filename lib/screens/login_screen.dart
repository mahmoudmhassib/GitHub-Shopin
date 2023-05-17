import 'package:flutter/material.dart';
import 'package:shop_in/screens/signup_screen.dart';

import '../button.dart';
import '../text_field.dart';
import '../text_field_password.dart';
import 'home_version.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _onClick(){
      Navigator.of(context).push(MaterialPageRoute(builder: (_)=>SignupScreen()));
    }
void _logClick(){
      print('15315153121');
      Navigator.of(context).push(MaterialPageRoute(builder: (_)=>HomeVersion()));
}
    return Scaffold(
      body: SafeArea(
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
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                    child: Icon(
                      Icons.arrow_back_sharp,
                    ),
                  ),
                 const SizedBox(height: 10.0,),
                 const Text(
                    'Login',
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
                    hintTitle: 'Email',
                    lableTitle: 'Email',
                  ),
                  TextFieldPassword(),
                ],
              ),
              const SizedBox(height:100.0,),
              Column(
                children: [
                  Center(
                    child: ButtonPress(
                      text: 'Log in',
                      onClick: _logClick,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                     const Text(
                        'Don\'t have an account?',
                        style: TextStyle(
                          color: Color(0xFFA3A3A3),
                          fontSize: 14,
                        ),
                      ),
                      TextButton(
                        onPressed: _onClick,
                        child:const Text(
                          'Sign Up',
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
