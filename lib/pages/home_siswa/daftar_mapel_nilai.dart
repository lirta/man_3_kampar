import 'package:apps/pages/home_siswa/navbar.dart';
import 'package:apps/provider/siswa/nilai_provider.dart';
import 'package:apps/provider/siswa/siswa_daftar_mapel_provider.dart';
import 'package:apps/widget/siswa_daftar_mapel_nilai.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../theme.dart';

class DaftarMapelNilaiSisa extends StatefulWidget {
  const DaftarMapelNilaiSisa({ Key key }) : super(key: key);

  @override
  _DaftarMapelNilaiSisaState createState() => _DaftarMapelNilaiSisaState();
}

class _DaftarMapelNilaiSisaState extends State<DaftarMapelNilaiSisa> {
  @override
  Widget build(BuildContext context) {
    NilaiProvider nilaiProvider =
        Provider.of<NilaiProvider>(context);
    Widget header() {
      return AppBar(
        backgroundColor: birumudaColor,
        elevation: 0,
        centerTitle: true,
        // automaticallyImplyLeading: false,
        title: Text('Daftar Nilai Keseluruhan'),
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
              "Daftar Mapel/",
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
                Navigator.pushNamed(context, '/home-siswa');
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
        child: nilaiProvider.nilai == null
            ? Text("tidak ada jadwal")
            : Column(
                children: nilaiProvider.nilai
                    .map((nilai) => SiswaDaftarMapelNilai(nilai))
                    .toList(),
              ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor6,
      resizeToAvoidBottomInset: false,
      appBar: header(),
      drawer: NavbarSiswa(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [daftarMapel()],
            ),
          ),
        ),
      ),
    );
  }
}