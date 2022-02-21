import 'package:apps/model/guru/daftar_nilai_guru_model.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class DaftarNilaiKeseluruhanGuru extends StatelessWidget {
  // const DaftarNilaiKeseluruhanGuru({ Key key }) : super(key: key);
  DaftarNilaiKeseluruhanGuru(this.nilai);
  DaftarNilaiGuruModel nilai;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    "Nilai Keseluruhan",
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
                    'Matapelajaran',
                    style: subtitleTextStyle.copyWith(fontWeight: medium),
                    maxLines: 3,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    nilai.mapel,
                    style: primaryTextStyle.copyWith(
                      fontSize: 12,
                      // fontWeight: medium
                    ),
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
                    nilai.ajaran,
                    style: primaryTextStyle.copyWith(
                      fontSize: 12,
                      // fontWeight: medium
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Nama Siswa',
                    style: subtitleTextStyle.copyWith(fontWeight: medium),
                    maxLines: 3,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    nilai.siswa,
                    style: primaryTextStyle.copyWith(
                      fontSize: 12,
                      // fontWeight: medium
                    ),
                    maxLines: 5,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Nilai',
                    style: subtitleTextStyle.copyWith(fontWeight: medium),
                    maxLines: 3,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    nilai.nilai,
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
    );
  }
}
