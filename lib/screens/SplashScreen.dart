import 'dart:async';
import 'package:flutter/material.dart';
import 'package:wallet/screens/loginScreen.dart';
// Import your welcome screen

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Navigate to LoginScreen after 4 seconds
    Future.delayed(Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => LoginScreen(),
        ),
      );
    });

    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset(
            //   'assets/images/heart.gif',
            //   width: 200,
            // ),
            SizedBox(height: 20),
            Text(
              "Vault",
              style: TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
