import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                    MyHomePage(),
            )
        )
    );
  }

  Widget build(BuildContext context) {
      return Scaffold(
        body: Container(
          child: Center(
            child: Image.asset('assets/splash-logo1.gif',
            width: 300,
              height: 300,
            ),
          ),
        ),


      );
    }
}