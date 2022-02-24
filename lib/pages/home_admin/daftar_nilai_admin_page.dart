import 'package:apps/pages/home_admin/navbar_admin.dart';
import 'package:apps/provider/guru/daftar_nilai_guru_provider.dart';
import 'package:apps/widget/daftar_nilai_keseluruhan_guru.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../theme.dart';

class DaftarNilaiAdminPage extends StatefulWidget {
  const DaftarNilaiAdminPage({Key key}) : super(key: key);

  @override
  _DaftarNilaiAdminPageState createState() => _DaftarNilaiAdminPageState();
}

class _DaftarNilaiAdminPageState extends State<DaftarNilaiAdminPage> {
  Widget build(BuildContext context) {
    DaftarNilaiGuruProvider daftarNilaiGuruProvider =
        Provider.of<DaftarNilaiGuruProvider>(context);
    // JadwalModel jadwal = jadwalProvider.jadwal;
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final _id_kls = args['id_kelas'];
    final _id_mapel = args['id_mapel'];
    final _mapel = args['mapel'];
    final _guru = args['guru'];
    Widget header() {
      return AppBar(
        backgroundColor: birumudaColor,
        elevation: 0,
        centerTitle: true,
        // automaticallyImplyLeading: false,
        title: Text('Nilai Akhir'),
      );
    }

    Widget tugas() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: birumudaColor,
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 17),
                blurRadius: 23,
                spreadRadius: -13,
                color: blackColor)
          ],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Detail Mapel",
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
              'Mata Pelajaran',
              style: primaryTextStyle.copyWith(fontWeight: medium),
              maxLines: 3,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              _mapel,
              style: subtitleTextStyle.copyWith(
                fontSize: 12,
                // fontWeight: medium
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Pengajar',
              style: primaryTextStyle.copyWith(fontWeight: medium),
              maxLines: 3,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              _guru,
              style: subtitleTextStyle.copyWith(
                fontSize: 12,
                // fontWeight: medium
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
        child: daftarNilaiGuruProvider.nilai == null
            ? Text("tidak ada data")
            : Column(
                children: daftarNilaiGuruProvider.nilai
                    .map((nilai) => DaftarNilaiKeseluruhanGuru(nilai))
                    .toList(),
              ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor6,
      resizeToAvoidBottomInset: false,
      appBar: header(),
      drawer: NavbarAdmin(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [tugas(), daftarMapel()],
            ),
          ),
        ),
      ),
    );
  }
}
