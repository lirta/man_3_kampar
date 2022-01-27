import 'package:apps/theme.dart';
import 'package:flutter/material.dart';

class DaftarSiswa extends StatelessWidget {
  const DaftarSiswa({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/detail-mapel');
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
                    "Nama Siswa",
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
                    "Nip",
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
