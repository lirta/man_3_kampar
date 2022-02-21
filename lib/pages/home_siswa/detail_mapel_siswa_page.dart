import 'package:apps/model/siswa/siswa_model.dart';
import 'package:apps/pages/home_siswa/navbar.dart';
import 'package:apps/provider/siswa/auth_siswa_provider.dart';
import 'package:apps/provider/siswa/daftar_absen_siswa_provider.dart';
import 'package:apps/provider/siswa/daftar_nilai_provider.dart';
import 'package:apps/provider/siswa/daftar_tugas_siswa_provider.dart';
import 'package:apps/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';

class DetailMapelSiswaPage extends StatefulWidget {
  const DetailMapelSiswaPage({Key key}) : super(key: key);

  @override
  _DetailMapelSiswaPageState createState() => _DetailMapelSiswaPageState();
}

class _DetailMapelSiswaPageState extends State<DetailMapelSiswaPage> {
  ProgressDialog pr;
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final _id_kls = args['id_kelas'];
    final _id_mapel = args['id_mapel'];
    final _mapel = args['mapel'];
    DaftarNilaiProvider daftarNilaiProvider =
        Provider.of<DaftarNilaiProvider>(context);
    DaftarTugasSiswaProvider daftarTugasSiswaProvider =
        Provider.of<DaftarTugasSiswaProvider>(context);
    DaftarAbsenSiswaProvider daftarAbsenSiswaProvider =
        Provider.of<DaftarAbsenSiswaProvider>(context);
    AuthSiswaProvider authSiswaProvider =
        Provider.of<AuthSiswaProvider>(context);
    SiswaModel siswa = authSiswaProvider.siswa;
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
        title: Text(_mapel),
      );
    }

    Widget daftarDetailMapelTitle() {
      return Container(
        margin: EdgeInsets.only(
          top: 10,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Row(
          children: [
            Text(
              _mapel + " /",
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

    Widget daftarDetailMapel() {
      return Container(
        margin: EdgeInsets.only(
          top: 14,
        ),
        child: Column(children: [
          // GestureDetector(
          //   onTap: () async {
          //     pr.show();
          //     if (await daftarAbsenSiswaProvider.getabsen(
          //         id_siswa: siswa.nis, id_matapelajaran: _id_mapel)) {
          //       pr.hide();
          //       Navigator.pushNamed(context, "/detail-absen-siswa", arguments: {
          //         'nama': siswa.nama,
          //         'nis': siswa.nis,
          //         'mapel': _mapel
          //       });
          //     }
          //   },
          //   child: Container(
          //     margin: EdgeInsets.only(top: 20),
          //     padding:
          //         EdgeInsets.only(top: 10, left: 12, bottom: 14, right: 20),
          //     decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(12),
          //         color: birutuaColor,
          //         boxShadow: [
          //           BoxShadow(
          //               offset: Offset(0, 17),
          //               blurRadius: 23,
          //               spreadRadius: -13,
          //               color: blackColor)
          //         ]),
          //     height: 100,
          //     child: Row(
          //       children: [
          //         SizedBox(
          //           width: 20,
          //         ),
          //         Icon(
          //           FontAwesomeIcons.users,
          //           size: 30,
          //         ),
          //         SizedBox(
          //           width: 20,
          //         ),
          //         Expanded(
          //           child: Text(
          //             "Absensi ",
          //             style: blackTextStyle.copyWith(
          //               fontSize: 25,
          //               fontWeight: semiBold,
          //             ),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          GestureDetector(
            onTap: () async {
              pr.show();
              if (await daftarTugasSiswaProvider.getdaftartugas(
                  id_kelas: _id_kls, id_mapel: _id_mapel)) {
                pr.hide();
                Navigator.pushNamed(context, '/daftar-tugas-siswa', arguments: {
                  'nama': siswa.nama,
                  'nis': siswa.nis,
                  'mapel': _mapel
                });
              }
            },
            child: Container(
              margin: EdgeInsets.only(top: 20),
              padding:
                  EdgeInsets.only(top: 10, left: 12, bottom: 14, right: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: birutuaColor,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 17),
                        blurRadius: 23,
                        spreadRadius: -13,
                        color: blackColor)
                  ]),
              height: 100,
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    FontAwesomeIcons.bookOpen,
                    size: 30,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Text(
                      "Daftar Soal",
                      style: blackTextStyle.copyWith(
                        fontSize: 25,
                        fontWeight: semiBold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              pr.show();
              if (await daftarNilaiProvider.getnilai(
                  id_kelas: _id_kls, id_mapel: _id_mapel, id_siswa: siswa.id)) {
                pr.hide();
                Navigator.pushNamed(context, '/nilai-siswa', arguments: {
                  'nama': siswa.nama,
                  'nis': siswa.nis,
                  'mapel': _mapel
                });
                print("berhasil");
              }
              // Navigator.pushNamed(context, '/nilai-siswa');
            },
            child: Container(
              margin: EdgeInsets.only(top: 20),
              padding:
                  EdgeInsets.only(top: 10, left: 12, bottom: 14, right: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: birutuaColor,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 17),
                        blurRadius: 23,
                        spreadRadius: -13,
                        color: blackColor)
                  ]),
              height: 100,
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    FontAwesomeIcons.bookOpen,
                    size: 30,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Text(
                      "Daftar Nilai",
                      style: blackTextStyle.copyWith(
                        fontSize: 25,
                        fontWeight: semiBold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      );
    }

    return Scaffold(
      backgroundColor: primaryColor,
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
              children: [daftarDetailMapel()],
            ),
          ),
        ),
      ),
    );
  }
}
