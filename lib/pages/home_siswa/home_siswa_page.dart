import 'package:apps/model/siswa/siswa_model.dart';
import 'package:apps/provider/siswa/auth_siswa_provider.dart';
import 'package:apps/provider/siswa/siswa_daftar_mapel_provider.dart';
import 'package:apps/service/server.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../theme.dart';

class HomeSiswaPage extends StatefulWidget {
  const HomeSiswaPage({Key key}) : super(key: key);

  @override
  _HomeSiswaPageState createState() => _HomeSiswaPageState();
}

class _HomeSiswaPageState extends State<HomeSiswaPage> {
  @override
  Widget build(BuildContext context) {
    SiswaDaftarMapelProvider siswaDaftarMapelProvider =
        Provider.of<SiswaDaftarMapelProvider>(context);
    AuthSiswaProvider authSiswaProvider =
        Provider.of<AuthSiswaProvider>(context);
    SiswaModel siswa = authSiswaProvider.siswa;
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
                    'Hallo,  ' + siswa.nama,
                    style: primaryTextStyle.copyWith(
                        fontSize: 24, fontWeight: semiBold),
                  ),
                  Text(
                    siswa.nis,
                    style: subtitleTextStyle.copyWith(fontSize: 16),
                    maxLines: 2,
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
                      image: NetworkImage(fotosiswaUrl + siswa.foto))),
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
              if (await siswaDaftarMapelProvider.getjadwal(
                  hari: "Senin", id: siswa.id_kelas)) {
                Navigator.pushNamed(context, '/daftar-mapel-siswa');
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
              if (await siswaDaftarMapelProvider.getjadwal(
                  hari: "Selasa", id: siswa.id_kelas)) {
                Navigator.pushNamed(context, '/daftar-mapel-siswa');
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
              if (await siswaDaftarMapelProvider.getjadwal(
                  hari: "Rabu", id: siswa.id_kelas)) {
                Navigator.pushNamed(context, '/daftar-mapel-siswa');
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
              if (await siswaDaftarMapelProvider.getjadwal(
                  hari: "Kamis", id: siswa.id_kelas)) {
                Navigator.pushNamed(context, '/daftar-mapel-siswa');
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
              if (await siswaDaftarMapelProvider.getjadwal(
                  hari: "Jumat", id: siswa.id_kelas)) {
                Navigator.pushNamed(context, '/daftar-mapel-siswa');
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
              if (await siswaDaftarMapelProvider.getjadwal(
                  hari: "Sabtu", id: siswa.id_kelas)) {
                Navigator.pushNamed(context, '/daftar-mapel-siswa');
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