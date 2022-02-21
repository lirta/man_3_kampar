import 'package:apps/model/guru/absen_seswa_model.dart';
import 'package:apps/model/siswa/daftar_absen_siswa_model.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class DaftarSiswaAbsen extends StatelessWidget {
  // const DaftarSiswaAbsen({Key key}) : super(key: key);
  DaftarAbsenSiswaModel absen_siswa;
  DaftarSiswaAbsen(this.absen_siswa);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.pushNamed(context, '/detail-tugas');
      },
      child: Container(
        margin: EdgeInsets.only(top: 10, bottom: 10),
        padding: EdgeInsets.only(top: 10, left: 12, bottom: 14, right: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: absen_siswa.absen == "Hadir"
                ? hadir
                : absen_siswa.absen == "Izin"
                    ? izin
                    : absen_siswa.absen == "Sakit"
                        ? sakit
                        : alpa,
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 17),
                  blurRadius: 23,
                  spreadRadius: -13,
                  color: blackColor)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              absen_siswa.tgl,
              // 'lirta',
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
            ),
            Text(
              absen_siswa.absen,
              // 'lirta',
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
