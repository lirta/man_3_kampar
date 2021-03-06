// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:apps/theme.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () => Navigator.pushNamed(context, '/login'));
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      backgroundColor: birumudaColor,
      body: Center(
        child: Container(
          width: 230,
          height: 250,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/logo_man.png',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
