import 'package:apps/model/guru/daftar_tugas_model.dart';
import 'package:apps/provider/guru/jawaban_provider.dart';
import 'package:apps/theme.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';

class DaftarTugas extends StatelessWidget {
  // const DaftarTugas({Key key}) : super(key: key);
  DaftarTugasModel d_tugas;
  DaftarTugas(this.d_tugas);
  ProgressDialog pr;

  @override
  Widget build(BuildContext context) {
    DaftarJawabanProvider daftarJawabanProvider =
        Provider.of<DaftarJawabanProvider>(context);
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
        pr.show();
        if (await daftarJawabanProvider.getjawaban(id: d_tugas.id_soal)) {
          pr.hide();
          Navigator.pushNamed(context, '/detail-tugas', arguments: {
            'jenis': d_tugas.jenis,
            'file': d_tugas.file,
            'tgl_kumpel': d_tugas.limit
          });
        }
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
