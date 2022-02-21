import 'package:apps/model/siswa/siswa_daftar_mapel_model.dart';
import 'package:apps/model/siswa/siswa_model.dart';
import 'package:apps/provider/siswa/auth_siswa_provider.dart';
import 'package:apps/provider/siswa/daftar_absen_siswa_provider.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';

import '../theme.dart';

class SiswaDaftarMapelAbsen extends StatelessWidget {
  // const SiswaDaftarMapel({Key key}) : super(key: key);
  SiswaDaftarMapelModel mapel;
  SiswaDaftarMapelAbsen(this.mapel);
  ProgressDialog pr;
  @override
  Widget build(BuildContext context) {
    AuthSiswaProvider authSiswaProvider =
        Provider.of<AuthSiswaProvider>(context);
    SiswaModel siswa = authSiswaProvider.siswa;
    DaftarAbsenSiswaProvider daftarAbsenSiswaProvider =
        Provider.of<DaftarAbsenSiswaProvider>(context);
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
      onTap: () async {
        pr.show();
        if (await daftarAbsenSiswaProvider.getabsen(
            id_siswa: siswa.nis, id_matapelajaran: mapel.id_mapel)) {
          pr.hide();
          Navigator.pushNamed(context, "/detail-absen-siswa", arguments: {
            'nama': siswa.nama,
            'nis': siswa.nis,
            'mapel': mapel.mapel
          });
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
                  // Text(
                  //   mapel.nama_kelas,
                  //   // 'lirta',
                  //   style: blackTextStyle.copyWith(
                  //     fontSize: 20,
                  //     fontWeight: semiBold,
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 5,
                  // ),
                  Text(
                    mapel.mapel,
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
