import 'package:apps/model/guru/jadwal_model.dart';
import 'package:apps/theme.dart';
import 'package:flutter/material.dart';

class DaftarMapel extends StatelessWidget {
  // const DaftarMapel(jadwal, {Key key}) : super(key: key);
  JadwalModel jadwal;
  DaftarMapel(this.jadwal);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/detail-mapel', arguments: {
          'id_kelas': jadwal.id_kls,
          'id_mapel': jadwal.id_mapel,
          'mapel': jadwal.mapel
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
                    jadwal.nama_kelas,
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
                    jadwal.mapel,
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
                    jadwal.jam_mulai + " - " + jadwal.jam_selesai,
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
