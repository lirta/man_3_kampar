import 'package:apps/model/siswa/daftar_tugas_siswa_model.dart';
import 'package:apps/model/siswa/siswa_model.dart';
import 'package:apps/provider/siswa/auth_siswa_provider.dart';
import 'package:apps/provider/siswa/siswa_jawaban_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme.dart';

class DaftarTugasSiswa extends StatelessWidget {
  // const DaftarTugasSiswa({ Key key }) : super(key: key);
  DaftarTugasSiswaModel tugas_siswa;
  DaftarTugasSiswa(this.tugas_siswa);

  @override
  Widget build(BuildContext context) {
    SiswaJawabanProvider siswaJawabanProvider =
        Provider.of<SiswaJawabanProvider>(context);
    AuthSiswaProvider authSiswaProvider =
        Provider.of<AuthSiswaProvider>(context);
    SiswaModel siswa = authSiswaProvider.siswa;
    return GestureDetector(
      onTap: () async {
        if (await siswaJawabanProvider.getjawaban(
            id: tugas_siswa.id_soal, id_siswa: siswa.id)) {
          Navigator.pushNamed(context, '/detail-tugas-siswa', arguments: {
            'jenis': tugas_siswa.jenis,
            'file': tugas_siswa.file,
            'tgl_kumpel': tugas_siswa.limit,
            'id_soal': tugas_siswa.id_soal,
          });
        } else {
          print("gagal");
          Navigator.pushNamed(context, '/detail-tugas-siswa', arguments: {
            'jenis': tugas_siswa.jenis,
            'file': tugas_siswa.file,
            'tgl_kumpel': tugas_siswa.limit,
            'id_soal': tugas_siswa.id_soal,
          });
        }
      },
      child: Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.only(top: 10, left: 12, bottom: 14, right: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: backgroundColor6),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tugas_siswa.jenis,
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
                    tugas_siswa.limit,
                    // 'lirta',
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    tugas_siswa.file,
                    // 'lirta',
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
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
