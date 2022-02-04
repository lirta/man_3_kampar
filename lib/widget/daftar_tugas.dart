import 'package:apps/model/guru/daftar_tugas_model.dart';
import 'package:apps/provider/guru/jawaban_provider.dart';
import 'package:apps/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DaftarTugas extends StatelessWidget {
  // const DaftarTugas({Key key}) : super(key: key);
  DaftarTugasModel d_tugas;
  DaftarTugas(this.d_tugas);

  @override
  Widget build(BuildContext context) {
    DaftarJawabanProvider daftarJawabanProvider =
        Provider.of<DaftarJawabanProvider>(context);
    return GestureDetector(
      onTap: () async {
        if (await daftarJawabanProvider.getjawaban(id: d_tugas.id_soal)) {
          Navigator.pushNamed(context, '/detail-tugas');
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
                    d_tugas.jenis,
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
                    d_tugas.limit,
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
                    d_tugas.file,
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
