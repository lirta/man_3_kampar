import 'package:apps/model/guru/absen_seswa_model.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class KehadiranSiswa extends StatelessWidget {
  // const KehadiranSiswa({Key key}) : super(key: key);
  AbsenSiswaModel absen;
  KehadiranSiswa(this.absen);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.pushNamed(context, '/detail-tugas');
      },
      child: Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.only(top: 10, left: 12, bottom: 14, right: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: absen.absen == "Hadir"
                ? hadir
                : absen.absen == "Izin"
                    ? izin
                    : absen.absen == "Sakit"
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
              absen.tgl,
              // 'lirta',
              style: blackTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold,
              ),
            ),
            Text(
              absen.absen,
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
