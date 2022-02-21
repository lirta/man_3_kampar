import 'package:apps/model/siswa/siswa_model.dart';
import 'package:apps/pages/home_siswa/navbar.dart';
import 'package:apps/provider/siswa/auth_siswa_provider.dart';
import 'package:apps/provider/siswa/siswa_daftar_mapel_provider.dart';
import 'package:apps/service/server.dart';
import 'package:apps/widget/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../theme.dart';

class HomeSiswaPage extends StatefulWidget {
  const HomeSiswaPage({Key key}) : super(key: key);

  @override
  _HomeSiswaPageState createState() => _HomeSiswaPageState();
}

String akses;
ProgressDialog pr;

class _HomeSiswaPageState extends State<HomeSiswaPage> {
  @override
  Widget build(BuildContext context) {
    SiswaDaftarMapelProvider siswaDaftarMapelProvider =
        Provider.of<SiswaDaftarMapelProvider>(context);
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
        backgroundColor: biruColor,
        centerTitle: true,
        title: Text("Pilih Hari "),
      );
    }

    Widget daftarHariTitle() {
      return Container(
        margin: EdgeInsets.only(
          top: 14,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Text(
          'Daftar Pelajaran',
          style: subtitleTextStyle.copyWith(
            fontSize: 22,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget daftarHari() {
      return Container(
        margin: EdgeInsets.only(left: 40),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Row(
            children: [
              GestureDetector(
                onTap: () async {
                  // SplashScreen();
                  // Navigator.pushNamed(context, 'sc');
                  pr.show();
                  if (await siswaDaftarMapelProvider.getjadwal(
                      hari: "Senin", id: siswa.id_kelas)) {
                    pr.hide();
                    Navigator.pushNamed(context, '/daftar-mapel-siswa');
                  } else {
                    pr.hide();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: alertColor,
                        content: Text(
                          'Hari Ini Tidak Ada Jadwal Mengajar',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.all(16),
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
                  height: 70,
                  width: 150,
                  child: Center(
                    child: Text(
                      "Senin",
                      style: blackTextStyle.copyWith(
                        fontSize: 25,
                        fontWeight: semiBold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () async {
                  pr.show();
                  if (await siswaDaftarMapelProvider.getjadwal(
                      hari: "Selasa", id: siswa.id_kelas)) {
                    pr.hide();
                    Navigator.pushNamed(context, '/daftar-mapel-siswa');
                  } else {
                    pr.hide();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: alertColor,
                        content: Text(
                          'Hari Ini Tidak Ada Jadwal Mengajar',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.all(16),
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
                  height: 70,
                  width: 150,
                  child: Center(
                    child: Text(
                      "Selasa",
                      style: blackTextStyle.copyWith(
                        fontSize: 25,
                        fontWeight: semiBold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () async {
                  pr.show();
                  if (await siswaDaftarMapelProvider.getjadwal(
                      hari: "Rabu", id: siswa.id_kelas)) {
                    pr.hide();
                    Navigator.pushNamed(context, '/daftar-mapel-siswa');
                  } else {
                    pr.hide();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: alertColor,
                        content: Text(
                          'Hari Ini Tidak Ada Jadwal Mengajar',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.all(16),
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
                  height: 70,
                  width: 150,
                  child: Center(
                    child: Text(
                      "Rabu",
                      style: blackTextStyle.copyWith(
                        fontSize: 25,
                        fontWeight: semiBold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () async {
                  pr.show();
                  if (await siswaDaftarMapelProvider.getjadwal(
                      hari: "Kamis", id: siswa.id_kelas)) {
                    pr.hide();
                    Navigator.pushNamed(context, '/daftar-mapel-siswa');
                  } else {
                    pr.hide();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: alertColor,
                        content: Text(
                          'Hari Ini Tidak Ada Jadwal Mengajar',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.all(16),
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
                  height: 70,
                  width: 150,
                  child: Center(
                    child: Text(
                      "Kamis",
                      style: blackTextStyle.copyWith(
                        fontSize: 25,
                        fontWeight: semiBold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () async {
                  pr.show();
                  if (await siswaDaftarMapelProvider.getjadwal(
                      hari: "Jumat", id: siswa.id_kelas)) {
                    pr.hide();
                    Navigator.pushNamed(context, '/daftar-mapel-siswa');
                  } else {
                    pr.hide();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: alertColor,
                        content: Text(
                          'Hari Ini Tidak Ada Jadwal Mengajar',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.all(16),
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
                  height: 70,
                  width: 150,
                  child: Center(
                    child: Text(
                      "Jum'at",
                      style: blackTextStyle.copyWith(
                        fontSize: 25,
                        fontWeight: semiBold,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () async {
                  pr.show();
                  if (await siswaDaftarMapelProvider.getjadwal(
                      hari: "Sabtu", id: siswa.id_kelas)) {
                    pr.hide();
                    Navigator.pushNamed(context, '/daftar-mapel-siswa');
                  } else {
                    pr.hide();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: alertColor,
                        content: Text(
                          'Hari Ini Tidak Ada Jadwal Mengajar',
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }
                },
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.all(16),
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
                  height: 70,
                  width: 150,
                  child: Center(
                    child: Text(
                      "Sabtu",
                      style: blackTextStyle.copyWith(
                        fontSize: 25,
                        fontWeight: semiBold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]),
      );
    }

    return Scaffold(
      appBar: header(),
      drawer: NavbarSiswa(),
      body: ListView(
        children: [daftarHari()],
      ),
    );
    // return ListView(
    //   children: [header(), daftarHariTitle(), daftarHari()],
    // );
  }
}
