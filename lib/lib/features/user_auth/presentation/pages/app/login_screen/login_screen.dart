import 'package:bloc_demo_app/lib/features/home/ui/home.dart';
import 'package:bloc_demo_app/lib/servies/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../widgets/form_controller_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthService authService = AuthService();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Google Sign In"),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              User? user = await authService.handleSignIn();
              if (user != null) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              } else {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('SIgn-in failed')));
              }
            },
            child: Text("SignIn with google")),
      ),
    );
  }
}
