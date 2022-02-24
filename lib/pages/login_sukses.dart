// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:apps/theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Sucsec extends StatefulWidget {
  const Sucsec({Key key}) : super(key: key);

  @override
  State<Sucsec> createState() => _SucsecState();
}

class _SucsecState extends State<Sucsec> {
  @override
  Future<void> initState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // var akses = prefs.getString("akses");
    // if (akses == "1") {
    //   Timer(Duration(seconds: 3),
    //       () => Navigator.pushNamed(context, '/index-admin'));
    // } else if (akses == "2") {
    //   Timer(Duration(seconds: 3),
    //       () => Navigator.pushNamed(context, '/index-guru'));
    // } else {
    //   Timer(Duration(seconds: 3), () => Navigator.pushNamed(context, '/index'));
    // }
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
