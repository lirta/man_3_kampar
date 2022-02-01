import 'package:apps/provider/guru/daftar_tugas_provider.dart';
import 'package:apps/widget/daftar_siswa.dart';
import 'package:apps/widget/daftar_tugas.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../theme.dart';

class DaftarTugasPage extends StatelessWidget {
  const DaftarTugasPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DaftarTugasProvider daftarTugasProvider =
        Provider.of<DaftarTugasProvider>(context);
    Widget header() {
      return AppBar(
        backgroundColor: birumudaColor,
        elevation: 0,
        centerTitle: true,
        // automaticallyImplyLeading: false,
        title: Text('Daftar Tugas'),
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
        child: daftarTugasProvider.d_tugas == null
            ? Text("Tidak ada tugas")
            : Column(
                children: daftarTugasProvider.d_tugas
                    .map((d_tugas) => DaftarTugas(d_tugas))
                    .toList()),
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
