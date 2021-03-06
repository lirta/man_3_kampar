import 'package:apps/pages/home_siswa/navbar.dart';
import 'package:apps/provider/siswa/daftar_tugas_siswa_provider.dart';
import 'package:apps/widget/daftar_tugas_siswa.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../theme.dart';

class DaftarTugasSiswaPage extends StatefulWidget {
  const DaftarTugasSiswaPage({Key key}) : super(key: key);

  @override
  _DaftarTugasSiswaPageState createState() => _DaftarTugasSiswaPageState();
}

class _DaftarTugasSiswaPageState extends State<DaftarTugasSiswaPage> {
  @override
  Widget build(BuildContext context) {
    DaftarTugasSiswaProvider daftarTugasSiswaProvider =
        Provider.of<DaftarTugasSiswaProvider>(context);
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
        title: Text(
          'Daftar Soal ' + _mapel,
          maxLines: 2,
        ),
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

    Widget daftarSiswa() {
      return Container(
        margin: EdgeInsets.only(
          top: 14,
        ),
        child: daftarTugasSiswaProvider.tugas_siswa == null
            ? Text("Tidak ada tugas")
            : Column(
                children: daftarTugasSiswaProvider.tugas_siswa
                    .map((tugas_siswa) => DaftarTugasSiswa(tugas_siswa))
                    .toList()),
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
              children: [daftarSiswa()],
            ),
          ),
        ),
      ),
    );
  }
}
