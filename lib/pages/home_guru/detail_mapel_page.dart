import 'package:apps/pages/home_guru/navbar_guru.dart';
import 'package:apps/provider/guru/daftar_siswa_perkelas_provider.dart';
import 'package:apps/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';

class DetailMapelPage extends StatefulWidget {
  const DetailMapelPage({Key key}) : super(key: key);

  @override
  _DetailMapelPageState createState() => _DetailMapelPageState();
}

class _DetailMapelPageState extends State<DetailMapelPage> {
  ProgressDialog pr;
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final _id_kls = args['id_kelas'];
    final _id_mapel = args['id_mapel'];
    final _mapel = args['mapel'];
    DaftarSiswaPerkelasProvider daftarSiswaPerkelasProvider =
        Provider.of<DaftarSiswaPerkelasProvider>(context);
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

    Widget daftarDetailMapel() {
      return Container(
        margin: EdgeInsets.only(
          top: 14,
        ),
        child: Column(children: [
          GestureDetector(
            onTap: () async {
              pr.show();
              if (await daftarSiswaPerkelasProvider.getsiswaPerkelas(
                  id: _id_kls)) {
                pr.hide();
                Navigator.pushNamed(context, '/daftar-siswa',
                    arguments: {'id_mapel': _id_mapel});
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
                    FontAwesomeIcons.users,
                    size: 30,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Text(
                      "Daftar Absen",
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
          // GestureDetector(
          //   onTap: () {
          //     Navigator.pushNamed(context, '/tugas', arguments: {
          //       'id_kelas': _id_kls,
          //       'id_mapel': _id_mapel,
          //       'mapel': _mapel
          //     });
          //   },
          //   child: Container(
          //     margin: EdgeInsets.only(top: 20),
          //     padding:
          //         EdgeInsets.only(top: 10, left: 12, bottom: 14, right: 20),
          //     decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(12),
          //          color: birutuaColor,
          //             boxShadow: [
          //               BoxShadow(
          //                   offset: Offset(0, 17),
          //                   blurRadius: 23,
          //                   spreadRadius: -13,
          //                   color: blackColor)
          //             ]),
          //     height: 100,
          //     child: Row(
          //       children: [
          //         SizedBox(
          //           width: 20,
          //         ),
          //         Icon(
          //           FontAwesomeIcons.bookOpen,
          //           size: 30,
          //         ),
          //         SizedBox(
          //           width: 20,
          //         ),
          //         Expanded(
          //           child: Text(
          //             "Tugas",
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
              if (await daftarSiswaPerkelasProvider.getsiswaPerkelas(
                  id: _id_kls)) {
                pr.hide();
                Navigator.pushNamed(context, '/daftar-absensi',
                    arguments: {'id_mapel': _id_mapel, 'id_kelas': _id_kls});
              }
              // Navigator.pushNamed(context, ' /daftar-absensi');
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
                    FontAwesomeIcons.pencilAlt,
                    size: 30,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Text(
                      "Add Absensi",
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
              children: [ daftarDetailMapel()],
            ),
          ),
        ),
      ),
    );
  }
}
