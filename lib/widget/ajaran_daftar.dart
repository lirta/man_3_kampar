import 'package:apps/model/guru/ajaran_model.dart';
import 'package:apps/model/guru/guru_model.dart';
import 'package:apps/provider/guru/auth_guru_provider.dart';
import 'package:apps/provider/guru/jadwal_provider.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';

import '../theme.dart';

class AjaranDaftar extends StatelessWidget {
  // const AjaranDaftar({ Key key }) : super(key: key);
  AjaranDaftar(this.ajaran);
  AjaranModel ajaran;

  ProgressDialog pr;
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
    return GestureDetector(
      // onTap: () {
      //   Navigator.pushNamed(context, '/tugas', arguments: {
      //     'id_kelas': jadwal.id_kls,
      //     'id_mapel': jadwal.id_mapel,
      //     'mapel': jadwal.mapel
      //   });
      // },
      onTap: () async {
        pr.show();
        if (await jadwalProvider.getmapel(id: guru.id)) {
          pr.hide();
          Navigator.pushNamed(context, '/daftar-mapel-absen');
        } else {
          pr.hide();
        }
      },
      child: Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.only(top: 10, left: 12, bottom: 14, right: 20),
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
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tahun Ajaran",
                    // 'lirta',
                    style: blackTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    ajaran.ajaran,
                    // 'lirta',
                    style: blackTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
