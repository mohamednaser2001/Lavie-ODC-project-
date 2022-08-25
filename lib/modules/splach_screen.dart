
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lavie/components/components.dart';
import 'package:lavie/modules/login_screen/login_screen.dart';

class MainSplashScreen extends StatelessWidget {
  const MainSplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      body: AnimatedSplashScreen(
        splash: logoBuilder(size),
        nextScreen: LoginScreen(),
        splashTransition: SplashTransition.slideTransition,
        duration: 3000,
      ),
    );
  }
}