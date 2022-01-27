import 'package:apps/theme.dart';
import 'package:apps/widget/custom_tabbar.dart';
import 'package:apps/widget/daftar_hari.dart';
import 'package:apps/widget/daftar_mapel.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
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

    Widget daftarHariTitle() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Text(
          'Daftar Hari Mengajar',
          style: subtitleTextStyle.copyWith(
            fontSize: 22,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget daftarHari() {
      return Container(
        margin: EdgeInsets.only(top: 14, left: 10, right: 10),
        child: Column(children: [
          DaftarHari(),
          DaftarHari(),
          DaftarHari(),
          DaftarHari(),
          DaftarHari(),
          DaftarHari(),
          DaftarHari(),
          DaftarHari(),
          DaftarHari(),
        ]),
      );
    }

    return ListView(
      children: [header(), daftarHariTitle(), daftarHari()],
    );
  }
}
