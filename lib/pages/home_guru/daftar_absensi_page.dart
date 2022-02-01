import 'package:apps/widget/daftar_absen_siswa.dart';
import 'package:apps/widget/daftar_siswa.dart';
import 'package:flutter/material.dart';

import '../../theme.dart';

class DaftarAbsensiPage extends StatefulWidget {
  const DaftarAbsensiPage({Key key}) : super(key: key);

  @override
  _DaftarAbsensiPageState createState() => _DaftarAbsensiPageState();
}

class _DaftarAbsensiPageState extends State<DaftarAbsensiPage> {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: birumudaColor,
        elevation: 0,
        centerTitle: true,
        // automaticallyImplyLeading: false,
        title: Text('Daftar Absensi Siswa'),
      );
    }

    Widget daftarSiswaTitle() {
      return Container(
        margin: EdgeInsets.only(
          top: 10,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Row(
          children: [
            Text(
              "Daftar Absensi Siswa /",
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
          DaftarAbsenSiswa(),
          DaftarAbsenSiswa(),
          DaftarAbsenSiswa(),
          DaftarAbsenSiswa(),
          DaftarAbsenSiswa(),
          DaftarAbsenSiswa(),
          DaftarAbsenSiswa(),
          DaftarAbsenSiswa(),
          DaftarAbsenSiswa(),
        ]),
      );
    }

    return Scaffold(
      backgroundColor: primaryColor,
      resizeToAvoidBottomInset: false,
      appBar: header(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [daftarSiswaTitle(), daftarSiswa()],
            ),
          ),
        ),
      ),
    );
  }
}
