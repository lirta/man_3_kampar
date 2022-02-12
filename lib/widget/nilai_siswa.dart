import 'package:apps/model/siswa/daftar_nilai_model.dart';
import 'package:apps/theme.dart';
import 'package:flutter/material.dart';

class NilaiSiswa extends StatelessWidget {
  // const NilaiSiswa({ Key key }) : super(key: key);
  DaftarNilaiModel nilai;
  NilaiSiswa(this.nilai);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(top: 10, left: 12, bottom: 14, right: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: birumudaColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            nilai.jenis,
            // 'lirta',
            style: blackTextStyle.copyWith(
              fontSize: 20,
              fontWeight: semiBold,
            ),
          ),
          Text(
            nilai.nilai == null ? 'Nilai Belum Ada' : nilai.nilai,
            // 'lirta',
            style: blackTextStyle.copyWith(
              fontSize: 20,
              fontWeight: semiBold,
            ),
          ),
        ],
      ),
    );
  }
}
