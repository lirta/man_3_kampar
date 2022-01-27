import 'package:apps/theme.dart';
import 'package:flutter/material.dart';

class DaftarHari extends StatelessWidget {
  const DaftarHari({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/daftar-mapel');
      },
      child: Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.only(top: 10, left: 12, bottom: 14, right: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: backgroundColor6),
        height: 100,
        child: Row(
          children: [
            Expanded(
              child: Text(
                "hari",
                style: blackTextStyle.copyWith(
                  fontSize: 25,
                  fontWeight: semiBold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
