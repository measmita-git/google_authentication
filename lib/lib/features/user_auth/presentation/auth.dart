import 'package:bloc_demo_app/lib/features/home/ui/home.dart';
import 'package:bloc_demo_app/lib/features/user_auth/presentation/pages/app/login_screen/login_screen.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, AsyncSnapshot<User?> snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if(snapshot.hasData) {
            return HomePage();
          }
          else {
            return LoginScreen();
          }
        },

      ),
    );
  }
}
