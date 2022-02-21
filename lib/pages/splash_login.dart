import 'package:apps/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SplashLoginPage extends StatelessWidget {
  const SplashLoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor6,
      body: Center(
        child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
          children: [
                Text(
                  "Sign In As",
                  style: blackTextStyle.copyWith(fontSize: 30),
                ),
                SizedBox(
                  height: 10,
                ),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 120,
                  width: 120,
                  // margin: EdgeInsets.only(left: 30),
                  child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/sign-in-siswa');
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: birumudaColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Icon(
                        FontAwesomeIcons.userGraduate,
                        size: 100,
                        color: primaryColor,
                      )),
                ),
                // Text('Guru'),
                SizedBox(
                  width : 20,
                ),
                Container(
                  // padding: EdgeInsets.only(top: 20),
                  height: 120,
                  width: 120,
                  // margin: EdgeInsets.only(top: 30),
                  child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/sign-in');
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: biruColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Icon(
                        FontAwesomeIcons.userTie,
                        size: 100,
                        color: primaryColor,
                      )),
                ),
              ],
            ),
            Container(
                  height: 120,
                  width: 120,
                  margin: EdgeInsets.only(top: 30),
                  child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/sign-in-admin');
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: birumudaColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Icon(
                        FontAwesomeIcons.userCog,
                        size: 80,
                        color: primaryColor,
                      )),
                ),
          ],
        ),
      ),
    );
  }
}
