import 'package:apps/model/siswa/siswa_daftar_mapel_model.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class SiswaDaftarMapel extends StatelessWidget {
  // const SiswaDaftarMapel({Key key}) : super(key: key);
  SiswaDaftarMapelModel mapel;
  SiswaDaftarMapel(this.mapel);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/detail-mapel-siswa', arguments: {
          'id_kelas': mapel.id_kls,
          'id_mapel': mapel.id_mapel,
          'mapel': mapel.mapel
        });
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
                    mapel.nama_kelas,
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
                    mapel.mapel,
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
                    mapel.jam_mulai + " - " + mapel.jam_selesai,
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
