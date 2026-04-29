import 'dart:async';
import 'package:flutter/material.dart';
import 'main.dart'; // importa o meu main HomePage

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF0E4),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("imagens/logo.png", width: 300),
            SizedBox(height: 30),
            CircularProgressIndicator(color: Color(0xFFc65c69)),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
