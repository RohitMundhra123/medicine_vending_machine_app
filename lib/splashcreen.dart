import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:medicine_vending_machine/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: Colors.black,
      splash: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Image.asset(
            "assets/logo.png",
            height: 175,
          )),
          const SizedBox(
            height: 20,
          ),
          const Hero(
            tag: "title",
            child: Text(
              "Buy Your Medicine Here",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
      nextScreen: const MyHomePage(title: "Home"),
      splashIconSize: 250,
    );

    // Scaffold(
    //   backgroundColor: Colors.black,
    //   body:

    // );
  }
}
