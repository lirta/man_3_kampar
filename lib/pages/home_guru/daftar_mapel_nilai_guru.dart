import 'package:apps/model/guru/guru_model.dart';
import 'package:apps/pages/home_guru/navbar_guru.dart';
import 'package:apps/provider/guru/auth_guru_provider.dart';
import 'package:apps/provider/guru/jadwal_provider.dart';
import 'package:apps/widget/guru_daftar_mapel_nilai.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';

import '../../theme.dart';

class DaftarMapelNilaiGuru extends StatefulWidget {
  const DaftarMapelNilaiGuru({Key key}) : super(key: key);

  @override
  _DaftarMapelNilaiGuruState createState() => _DaftarMapelNilaiGuruState();
}

class _DaftarMapelNilaiGuruState extends State<DaftarMapelNilaiGuru> {
  ProgressDialog pr;
  @override
  Widget build(BuildContext context) {
    JadwalProvider jadwalProvider = Provider.of<JadwalProvider>(context);
    AuthGuruProvider authGuruProvider = Provider.of<AuthGuruProvider>(context);
    GuruModel guru = authGuruProvider.guru;
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final id_ajaran = args['id_ajaran'];
    final ajaran = args['ajaran'];
    pr = new ProgressDialog(context, type: ProgressDialogType.Normal);

    pr.style(
      message: 'Menunggu...',
      borderRadius: 10.0,
      backgroundColor: Colors.white,
      elevation: 10.0,
      insetAnimCurve: Curves.easeInOut,
      progress: 0.0,
      maxProgress: 100.0,
      progressTextStyle: TextStyle(
          color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
      messageTextStyle: TextStyle(
          color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600),
    );
    Widget header() {
      return AppBar(
        backgroundColor: birumudaColor,
        elevation: 0,
        centerTitle: true,
        // automaticallyImplyLeading: false,
        title: Text('Pilih Matapelajaran'),
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
        child: jadwalProvider.jadwal == null
            ? Text("tidak ada jadwal")
            : Column(
                children: jadwalProvider.jadwal
                    .map((jadwal) => GuruDaftarMapalNilai(jadwal))
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
