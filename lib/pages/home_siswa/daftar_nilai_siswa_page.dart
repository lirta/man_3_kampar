import 'package:apps/pages/home_siswa/navbar.dart';
import 'package:apps/provider/siswa/daftar_nilai_provider.dart';
import 'package:apps/widget/nilai_siswa.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../theme.dart';

class DaftarNilaiSiswaPage extends StatefulWidget {
  const DaftarNilaiSiswaPage({Key key}) : super(key: key);

  @override
  _DaftarNilaiSiswaPageState createState() => _DaftarNilaiSiswaPageState();
}

class _DaftarNilaiSiswaPageState extends State<DaftarNilaiSiswaPage> {
  @override
  Widget build(BuildContext context) {
    DaftarNilaiProvider daftarNilaiProvider =
        Provider.of<DaftarNilaiProvider>(context);
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final _id_kls = args['id_kelas'];
    final _id_mapel = args['id_mapel'];
    final _mapel = args['mapel'];
    Widget header() {
      return AppBar(
        backgroundColor: birumudaColor,
        elevation: 0,
        centerTitle: true,
        // automaticallyImplyLeading: false,
        title: Text('Daftar Nilai ' + _mapel),
      );
    }

    Widget detailNilaiTitle() {
      return Container(
        margin: EdgeInsets.only(
          top: 10,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Row(
          children: [
            Text(
              "Daftar Nilai Siswa /",
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

    Widget nilai() {
      return Container(
        margin: EdgeInsets.only(
          top: 14,
        ),
        child: daftarNilaiProvider.nilai == null
            ? Text("belum ada Data Nilai")
            : Column(
                children: daftarNilaiProvider.nilai
                    .map((nilai) => NilaiSiswa(nilai))
                    .toList(),
                //  [
                //   KehadiranSiswa(),
                //   KehadiranSiswa(),
                //   KehadiranSiswa(),
                //   KehadiranSiswa(),
                //   KehadiranSiswa(),
                //   KehadiranSiswa(),
                //   KehadiranSiswa(),
                //   KehadiranSiswa(),
                //   KehadiranSiswa(),
                // ]
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
              children: [nilai()],
            ),
          ),
        ),
      ),
    );
  }
}
