import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../widgets/form_controller_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Login'),
              SizedBox(
                height: 30,
              ),

              const FormContainerWidget(
                hintText: "Email",
                isPasswordField: false,
              ),
              SizedBox(height: 10,),
              const FormContainerWidget(
                hintText: "Password",
                isPasswordField: true,
              ),
              const SizedBox(height: 30,),
              Container(
                width: double.infinity,
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.blue,

                ),
                child: Center(child: Text('Login')),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Text('Don\'t have an account?'),
                  SizedBox(width: 5,),
                  Text('Sign Up',style: TextStyle(color: Colors.blue,fontSize: 16,fontWeight: FontWeight.w500),),
                ],
              ),
            ],
          ),
        ),
      )
    );
  }
}
