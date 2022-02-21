import 'package:apps/model/guru/guru_model.dart';
import 'package:apps/pages/home_guru/navbar_guru.dart';
import 'package:apps/provider/guru/auth_guru_provider.dart';
import 'package:apps/provider/guru/jadwal_provider.dart';
import 'package:apps/service/server.dart';
import 'package:apps/theme.dart';
// import 'package:apps/widget/daftar_hari.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  String akses;
  ProgressDialog pr;
  // void initState() {
  //   cekUser();
  //   super.initState();
  // }

  // cekUser() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   akses = prefs.getString("akses");
  //   if (akses != "2") {
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     prefs.remove("id");
  //     prefs.setBool("is_login", false);
  //     Navigator.pushNamedAndRemoveUntil(
  //         context, '/splash-login', (route) => false);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    JadwalProvider jadwalProvider = Provider.of<JadwalProvider>(context);
    AuthGuruProvider authGuruProvider = Provider.of<AuthGuruProvider>(context);
    GuruModel guru = authGuruProvider.guru;
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
        title: Text('Pilih Hari'),
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
                  pr.show();
                  if (await jadwalProvider.getjadwal(
                      hari: "Senin", id: guru.id)) {
                    pr.hide();
                    Navigator.pushNamed(context, '/daftar-mapel');
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
                  if (await jadwalProvider.getjadwal(
                      hari: "Selasa", id: guru.id)) {
                    pr.hide();
                    Navigator.pushNamed(context, '/daftar-mapel');
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
                  if (await jadwalProvider.getjadwal(
                      hari: "Rabu", id: guru.id)) {
                    pr.hide();
                    Navigator.pushNamed(context, '/daftar-mapel');
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
                  if (await jadwalProvider.getjadwal(
                      hari: "Kamis", id: guru.id)) {
                    pr.hide();
                    Navigator.pushNamed(context, '/daftar-mapel');
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
                  if (await jadwalProvider.getjadwal(
                      hari: "Jumat", id: guru.id)) {
                    pr.hide();
                    Navigator.pushNamed(context, '/daftar-mapel');
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
                      "Jumat",
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
                  if (await jadwalProvider.getjadwal(
                      hari: "Sabtu", id: guru.id)) {
                    pr.hide();
                    Navigator.pushNamed(context, '/daftar-mapel');
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
      drawer: NavbarGuru(),
      body: ListView(
        children: [daftarHari()],
      ),
    );
    // return ListView(
    //   children: [header(), daftarHariTitle(), daftarHari()],
    // );
  }
}
