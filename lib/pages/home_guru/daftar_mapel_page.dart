import 'package:apps/theme.dart';
import 'package:apps/widget/daftar_mapel.dart';
import 'package:flutter/material.dart';

class DaftarMapelPage extends StatefulWidget {
  const DaftarMapelPage({Key key}) : super(key: key);

  @override
  _DaftarMapelPageState createState() => _DaftarMapelPageState();
}

class _DaftarMapelPageState extends State<DaftarMapelPage> {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultMargin, left: defaultMargin, right: defaultMargin),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hallo, Guru',
                    style: primaryTextStyle.copyWith(
                        fontSize: 24, fontWeight: semiBold),
                  ),
                  Text(
                    'Nip guru',
                    style: subtitleTextStyle.copyWith(fontSize: 16),
                  )
                ],
              ),
            ),
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('assets/image_profile.png'))),
            )
          ],
        ),
      );
    }

    Widget daftarMapelTitle() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Row(
          children: [
            Text(
              "Daftar Mapel senin /",
              style: subtitleTextStyle.copyWith(
                fontSize: 18,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/home');
              },
              child: Text(
                'Home',
                style: subtitleTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: semiBold,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget daftarMapel() {
      return Container(
        margin: EdgeInsets.only(
          top: 14,
        ),
        child: Column(children: [
          DaftarMapel(),
          DaftarMapel(),
          DaftarMapel(),
          DaftarMapel(),
          DaftarMapel(),
          DaftarMapel(),
          DaftarMapel(),
          DaftarMapel(),
          DaftarMapel(),
        ]),
      );
    }

    return Scaffold(
      backgroundColor: primaryColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [header(), daftarMapelTitle(), daftarMapel()],
            ),
          ),
        ),
      ),
    );
  }
}
