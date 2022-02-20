import 'package:apps/model/siswa/kalender_model.dart';
import 'package:apps/model/siswa/siswa_daftar_mapel_model.dart';
import 'package:apps/model/siswa/siswa_model.dart';
import 'package:apps/provider/kalender_provider.dart';
import 'package:apps/provider/siswa/auth_siswa_provider.dart';
import 'package:apps/theme.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';

class SiswaDaftarMapelKalender extends StatelessWidget {
  // const SiswaDaftarMapelKalender({ Key key }) : super(key: key);
  SiswaDaftarMapelKalender(this.kalender);
  KalenderModel kalender;
  ProgressDialog pr;
  @override
  Widget build(BuildContext context) {
    KalenderProvider kalenderProvider = Provider.of<KalenderProvider>(context);
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
    return GestureDetector(
      onTap: () async {
        // pr.show();
        // if (await kalenderProvider.getkalender(
        //     id:siswa.id)) {
        //   pr.hide();
        //   Navigator.pushNamed(context, '/daftar-tugas-siswa', arguments: {
        //     'nama': siswa.nama,
        //     'nis': siswa.nis,
        //     'mapel': mapel.mapel
        //   });
        // }
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
              "Kalender Akademik",
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
              'Tahun Ajaran',
              style: subtitleTextStyle.copyWith(fontWeight: medium),
              maxLines: 3,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              kalender.ajaran,
              style: primaryTextStyle.copyWith(
                fontSize: 12,
                // fontWeight: medium
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Tanggal',
              style: subtitleTextStyle.copyWith(fontWeight: medium),
              maxLines: 3,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              kalender.tgl,
              style: primaryTextStyle.copyWith(
                fontSize: 12,
                // fontWeight: medium
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Kegiatan',
              style: subtitleTextStyle.copyWith(fontWeight: medium),
              maxLines: 3,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              kalender.kegiatan,
              style: primaryTextStyle.copyWith(
                fontSize: 12,
                // fontWeight: medium
              ),
              maxLines: 5,
            ),
            SizedBox(
              height: 5,
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
