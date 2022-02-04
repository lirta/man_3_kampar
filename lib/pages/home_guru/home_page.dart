import 'package:apps/model/guru/guru_model.dart';
import 'package:apps/provider/guru/auth_guru_provider.dart';
import 'package:apps/provider/guru/jadwal_provider.dart';
import 'package:apps/service/server.dart';
import 'package:apps/theme.dart';
// import 'package:apps/widget/daftar_hari.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    JadwalProvider jadwalProvider = Provider.of<JadwalProvider>(context);
    AuthGuruProvider authGuruProvider = Provider.of<AuthGuruProvider>(context);
    GuruModel guru = authGuruProvider.guru;
    Widget header() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultMargin, left: defaultMargin, right: defaultMargin),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hallo, ' + guru.nama,
                    style: primaryTextStyle.copyWith(
                        fontSize: 24, fontWeight: semiBold),
                  ),
                  Text(
                    guru.nip,
                    style: subtitleTextStyle.copyWith(fontSize: 16),
                  )
                ],
              ),
            ),
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(fotoUrl + guru.foto))),
            )
          ],
        ),
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
          'Daftar Hari Mengajar',
          style: subtitleTextStyle.copyWith(
            fontSize: 22,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget daftarHari() {
      return Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        child: Column(children: [
          GestureDetector(
            onTap: () async {
              if (await jadwalProvider.getjadwal(hari: "Senin", id: guru.id)) {
                Navigator.pushNamed(context, '/daftar-mapel');
              } else {
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
                  color: backgroundColor6),
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Senin",
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
              if (await jadwalProvider.getjadwal(hari: "Selasa", id: guru.id)) {
                Navigator.pushNamed(context, '/daftar-mapel');
              } else {
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
                  color: backgroundColor6),
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Selasa",
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
              if (await jadwalProvider.getjadwal(hari: "Rabu", id: guru.id)) {
                Navigator.pushNamed(context, '/daftar-mapel');
              } else {
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
                  color: backgroundColor6),
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Rabu",
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
              if (await jadwalProvider.getjadwal(hari: "Kamis", id: guru.id)) {
                Navigator.pushNamed(context, '/daftar-mapel');
              } else {
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
                  color: backgroundColor6),
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Kamis",
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
              if (await jadwalProvider.getjadwal(hari: "Jumat", id: guru.id)) {
                Navigator.pushNamed(context, '/daftar-mapel');
              } else {
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
                  color: backgroundColor6),
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Jumat",
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
              if (await jadwalProvider.getjadwal(hari: "Sabtu", id: guru.id)) {
                Navigator.pushNamed(context, '/daftar-mapel');
              } else {
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
                  color: backgroundColor6),
              height: 70,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Sabtu",
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

    return ListView(
      children: [header(), daftarHariTitle(), daftarHari()],
    );
  }
}
