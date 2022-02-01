import 'package:apps/widget/kehadiran_siswa.dart';
import 'package:flutter/material.dart';
import '../../theme.dart';

class DetailAbsenSiswaPage extends StatefulWidget {
  const DetailAbsenSiswaPage({Key key}) : super(key: key);

  @override
  _DetailAbsenSiswaPageState createState() => _DetailAbsenSiswaPageState();
}

class _DetailAbsenSiswaPageState extends State<DetailAbsenSiswaPage> {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: birumudaColor,
        elevation: 0,
        centerTitle: true,
        // automaticallyImplyLeading: false,
        title: Text('Detail Absensi Siswa'),
      );
    }

    Widget detailTugasTitle() {
      return Container(
        margin: EdgeInsets.only(
          top: 10,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Row(
          children: [
            Text(
              "Detail Absensi Siswa /",
              style: subtitleTextStyle.copyWith(
                fontSize: 18,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/home');
              },
              child: Text(
                'Home',
                style: subtitleTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: semiBold,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget tugas() {
      return Container(
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Detail Absensi Siswa",
              style: primaryTextStyle.copyWith(fontWeight: semiBold),
            ),
            Divider(
              thickness: 1,
              color: Color(0Xff2e3141),
            ),
            // SizedBox(
            //   height: 5,
            // ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                'Nama',
                style: primaryTextStyle.copyWith(fontWeight: medium),
                maxLines: 3,
              ),
              Text(
                "Siswa",
                style: subtitleTextStyle.copyWith(
                  fontSize: 12,
                  // fontWeight: medium
                ),
              ),
            ]),
            SizedBox(
              height: 5,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                'Nis',
                style: primaryTextStyle.copyWith(fontWeight: medium),
                maxLines: 3,
              ),
              Text(
                "Nis Siswa",
                style: subtitleTextStyle.copyWith(
                  fontSize: 12,
                  // fontWeight: medium
                ),
              ),
            ]),
          ],
        ),
      );
    }

    Widget detailTugas() {
      return Container(
        margin: EdgeInsets.only(
          top: 14,
        ),
        child: Column(children: [
          KehadiranSiswa(),
          KehadiranSiswa(),
          KehadiranSiswa(),
          KehadiranSiswa(),
          KehadiranSiswa(),
          KehadiranSiswa(),
          KehadiranSiswa(),
          KehadiranSiswa(),
          KehadiranSiswa(),
        ]),
      );
    }

    return Scaffold(
      backgroundColor: primaryColor,
      resizeToAvoidBottomInset: false,
      appBar: header(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [detailTugasTitle(), tugas(), detailTugas()],
            ),
          ),
        ),
      ),
    );
  }
}
