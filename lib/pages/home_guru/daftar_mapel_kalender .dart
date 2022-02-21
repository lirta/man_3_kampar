import 'package:apps/pages/home_guru/navbar_guru.dart';
import 'package:apps/pages/home_siswa/navbar.dart';
import 'package:apps/provider/kalender_provider.dart';
import 'package:apps/provider/siswa/siswa_daftar_mapel_provider.dart';
import 'package:apps/widget/siswa_daftar_mapel_kalender.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../theme.dart';

class DaftarMapelKalenderGuru extends StatefulWidget {
  const DaftarMapelKalenderGuru({ Key key }) : super(key: key);

  @override
  _DaftarMapelKalenderGuruState createState() => _DaftarMapelKalenderGuruState();
}

class _DaftarMapelKalenderGuruState extends State<DaftarMapelKalenderGuru> {
  @override
  Widget build(BuildContext context) {
    KalenderProvider kalenderProvider =
        Provider.of<KalenderProvider>(context);
    Widget header() {
      return AppBar(
        backgroundColor: birumudaColor,
        elevation: 0,
        centerTitle: true,
        // automaticallyImplyLeading: false,
        title: Text('Daftar Kalender'),
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
        child: kalenderProvider.kalender == null
            ? Text("tidak ada data")
            : Column(
                children: kalenderProvider.kalender
                    .map((kalender) => SiswaDaftarMapelKalender(kalender))
                    .toList(),
              ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor6,
      resizeToAvoidBottomInset: false,
      appBar: header(),
      drawer: NavbarGuru(),
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