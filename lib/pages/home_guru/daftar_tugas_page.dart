import 'package:apps/widget/daftar_siswa.dart';
import 'package:apps/widget/daftar_tugas.dart';
import 'package:flutter/material.dart';

import '../../theme.dart';

class DaftarTugasPage extends StatelessWidget {
  const DaftarTugasPage({Key key}) : super(key: key);

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

    Widget daftarSiswaTitle() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Row(
          children: [
            Text(
              "Daftar Tugas /",
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

    Widget daftarSiswa() {
      return Container(
        margin: EdgeInsets.only(
          top: 14,
        ),
        child: Column(children: [
          DaftarTugas(),
          DaftarTugas(),
          DaftarTugas(),
          DaftarTugas(),
          DaftarTugas(),
          DaftarTugas(),
          DaftarTugas(),
          DaftarTugas(),
          DaftarTugas(),
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
              children: [header(), daftarSiswaTitle(), daftarSiswa()],
            ),
          ),
        ),
      ),
    );
  }
}
