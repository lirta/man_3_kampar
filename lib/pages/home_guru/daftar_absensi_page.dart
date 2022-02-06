import 'package:apps/provider/guru/daftar_siswa_perkelas_provider.dart';
import 'package:apps/widget/daftar_absen_siswa.dart';
import 'package:apps/widget/daftar_siswa.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../theme.dart';

class DaftarAbsensiPage extends StatefulWidget {
  const DaftarAbsensiPage({Key key}) : super(key: key);

  @override
  _DaftarAbsensiPageState createState() => _DaftarAbsensiPageState();
}

class _DaftarAbsensiPageState extends State<DaftarAbsensiPage> {
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final _id_mapel = args['id_mapel'];
    final _id_kelas = args['id_kelas'];
    DaftarSiswaPerkelasProvider daftarSiswaPerkelasProvider =
        Provider.of<DaftarSiswaPerkelasProvider>(context);
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
        child: daftarSiswaPerkelasProvider.siswa == null
            ? Text("Tidak ada siswa")
            : Column(
                children: daftarSiswaPerkelasProvider.siswa
                    .map((siswa) =>
                        DaftarAbsenSiswa(siswa, _id_mapel, _id_kelas))
                    .toList(),
                //      [
                //   DaftarAbsenSiswa(),
                //   DaftarAbsenSiswa(),
                //   DaftarAbsenSiswa(),
                //   DaftarAbsenSiswa(),
                //   DaftarAbsenSiswa(),
                //   DaftarAbsenSiswa(),
                //   DaftarAbsenSiswa(),
                //   DaftarAbsenSiswa(),
                //   DaftarAbsenSiswa(),
                // ]
              ),
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
