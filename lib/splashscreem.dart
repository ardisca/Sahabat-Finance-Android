import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'home.dart';
import 'splashscreem.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:lottie/lottie.dart';
import './widget/Gradient.dart';

class splass extends StatelessWidget {
  const splass({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Container(
          decoration: BoxDecoration(gradient: LGradient()),
          child: AnimatedSplashScreen(
            duration: 5500,
            splashTransition: SplashTransition.fadeTransition,
            backgroundColor: Colors.transparent,
            splashIconSize: double.infinity,
            splash: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  './assets/splash.json',
                ),
                Text(
                  "Sahabat Finance",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 25),
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  "Rencanakan mimpimu",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
                Text(
                  "bersamaku",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                )
              ],
            ),
            nextScreen: HomePage(),
          ),
        ),
      ),
    );
  }
}
