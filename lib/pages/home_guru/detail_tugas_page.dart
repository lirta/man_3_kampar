import 'package:apps/provider/guru/jawaban_provider.dart';
import 'package:apps/widget/daftar_tugas.dart';
import 'package:apps/widget/tugas_siswa.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../theme.dart';

class DetailTugasPage extends StatefulWidget {
  const DetailTugasPage({Key key}) : super(key: key);

  @override
  _DetailTugasPageState createState() => _DetailTugasPageState();
}

class _DetailTugasPageState extends State<DetailTugasPage> {
  @override
  Widget build(BuildContext context) {
    DaftarJawabanProvider daftarJawabanProvider =
        Provider.of<DaftarJawabanProvider>(context);
    Widget header() {
      return AppBar(
        backgroundColor: birumudaColor,
        elevation: 0,
        centerTitle: true,
        // automaticallyImplyLeading: false,
        title: Text('Detail Tugas'),
      );
    }

    Widget detailTugasTitle() {
      return Container(
        margin: EdgeInsets.only(
          top: 10,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Row(
          children: [
            Text(
              "Detail Tugas /",
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

    Widget tugas() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Detail Tugas",
              style: primaryTextStyle.copyWith(fontWeight: semiBold),
            ),
            Divider(
              thickness: 1,
              color: Color(0Xff2e3141),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Jenis Tugas',
              style: primaryTextStyle.copyWith(fontWeight: medium),
              maxLines: 3,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Ulangan",
              style: subtitleTextStyle.copyWith(
                fontSize: 12,
                // fontWeight: medium
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Tanggal Di Kumpul',
              style: primaryTextStyle.copyWith(fontWeight: medium),
              maxLines: 3,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "20-2-2022",
              style: subtitleTextStyle.copyWith(
                fontSize: 12,
                // fontWeight: medium
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Deskripsi',
              style: primaryTextStyle.copyWith(fontWeight: medium),
              maxLines: 3,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Kerjakan Seendiri sendiri",
              style: subtitleTextStyle.copyWith(
                fontSize: 12,
                // fontWeight: medium
              ),
            ),
          ],
        ),
      );
    }

    Widget detailTugas() {
      return Container(
        margin: EdgeInsets.only(
          top: 14,
        ),
        child: daftarJawabanProvider.jawaban == null
            ? Text("Tidah ada data Jawaban")
            : Column(
                children: daftarJawabanProvider.jawaban
                    .map((jawaban) => TugasSiswa(jawaban))
                    .toList(),
                //  [
                //   TugasSiswa(),
                //   TugasSiswa(),
                //   TugasSiswa(),
                //   TugasSiswa(),
                //   TugasSiswa(),
                //   TugasSiswa(),
                //   TugasSiswa(),
                //   TugasSiswa(),
                //   // DaftarTugas(),
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
              children: [detailTugasTitle(), tugas(), detailTugas()],
            ),
          ),
        ),
      ),
    );
  }
}
