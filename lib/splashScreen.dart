import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login222.dart';
import 'loginScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();

    Timer(Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Login222(),
      ));
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.brown[100],
        child: Center( // Center the content
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Image.asset('logo.png', height: 250,width: 250,), // Your image
          // Text(
          //   'Iconix Edge', // Your text
          //   style: TextStyle(
          //     fontSize: 50,
          //     fontWeight: FontWeight.w700,
          //     color: Colors.black38,
          //   ),
          // ),
       ], ),
      ),
    ));
  }
}
