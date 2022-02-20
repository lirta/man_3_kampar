import 'package:apps/model/guru/daftar_siswa_perkelas.dart';
import 'package:apps/provider/guru/absen_siswa_provider.dart';
import 'package:apps/service/server.dart';
import 'package:apps/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DaftarSiswa extends StatelessWidget {
  // const DaftarSiswa({Key key}) : super(key: key);
  DaftarSiswaPerkelasModel siswa;
  String id_mapel;
  DaftarSiswa(this.siswa, this.id_mapel);
  @override
  Widget build(BuildContext context) {
    String _id_siswa = siswa.id_siswa;
    AbsenSiswaProvider absenSiswaProvider =
        Provider.of<AbsenSiswaProvider>(context);
    return GestureDetector(
      onTap: () async {
        if (await absenSiswaProvider.getabsen(
            id_siswa: _id_siswa, id_matapelajaran: id_mapel)) {
          Navigator.pushNamed(context, "/detail-absensi",
              arguments: {'nama': siswa.nama, 'nis': siswa.nis});
        }
        // Navigator.pushNamed(context, '/detail-mapel');
      },
      child: Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.only(top: 10, left: 12, bottom: 14, right: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: birutuaColor,
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0, 17),
                            blurRadius: 23,
                            spreadRadius: -13,
                            color: blackColor)
                      ]),
        child: Row(
          children: [ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    fotosiswaUrl + siswa.foto,
                    width: 50,
                    height: 50,
                    // fit: BoxFit.cover,
                  )),
            
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // id_mapel,
                    siswa.nama,
                    // 'lirta',
                    style: blackTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: semiBold,
                    ),
                    maxLines: 2,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    siswa.nis,
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
