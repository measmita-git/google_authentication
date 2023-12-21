import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'lib/features/home/ui/home.dart';
import 'lib/features/home/ui/home_bloc.dart';
import 'lib/features/user_auth/presentation/pages/app/login_screen/signup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.teal,
      ),
      // home : SignUpScreen(),
      home: BlocProvider(
        create: (context) => HomeBloc(),
        child: const HomePage(),
      ),
    );
  }
}
