
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../firebase_auth_implementation/firebase_auth_ser.dart';
import '../../../widgets/form_controller_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final FirebaseAuthService _auth = FirebaseAuthService();

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
                const Text('SignUp'),
                SizedBox(
                  height: 30,
                ),

                FormContainerWidget(
                  hintText: "Username",
                  isPasswordField: false,
                  controller: _usernameController,
                ),
                SizedBox(height: 10,),
                FormContainerWidget(
                  hintText: "Email",
                  isPasswordField: false,
                  controller: _emailController,
                ),
                SizedBox(height: 10,),
                FormContainerWidget(
                  hintText: "Password",
                  isPasswordField: true,
                  controller: _passwordController,
                ),
                const SizedBox(height: 30,),
                GestureDetector(
                  onTap: _signUp,
                  child: Container(
                    width: double.infinity,
                    height: 45,
                    decoration: BoxDecoration(
                      color: Colors.blue,

                    ),
                    child: Center(child: Text('SignUp')),
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Text('Already have an account?'),
                    SizedBox(width: 5,),
                    Text('Login',style: TextStyle(color: Colors.blue,fontSize: 16,fontWeight: FontWeight.w500),),
                  ],
                )
              ],
            ),
          ),
        )
    );
  }

  void _signUp() async{
    String username = _usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;
    
    User? user = await _auth.signUpWithEmailAndPassword(email, password);
    
    if(user != null){
      print("User is successfully created");
      Navigator.pushNamed(context, "/home");
    }else{
      print("Some error occured.");
    }


  }
}
