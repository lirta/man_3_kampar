import 'package:apps/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailMapelPage extends StatefulWidget {
  const DetailMapelPage({Key key}) : super(key: key);

  @override
  _DetailMapelPageState createState() => _DetailMapelPageState();
}

class _DetailMapelPageState extends State<DetailMapelPage> {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.only(
            top: defaultMargin, left: defaultMargin, right: defaultMargin),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hallo, Guru',
                    style: primaryTextStyle.copyWith(
                        fontSize: 24, fontWeight: semiBold),
                  ),
                  Text(
                    'Nip guru',
                    style: subtitleTextStyle.copyWith(fontSize: 16),
                  )
                ],
              ),
            ),
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('assets/image_profile.png'))),
            )
          ],
        ),
      );
    }

    Widget daftarDetailMapelTitle() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Row(
          children: [
            Text(
              "Matematika /",
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

    Widget daftarDetailMapel() {
      return Container(
        margin: EdgeInsets.only(
          top: 14,
        ),
        child: Column(children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/daftar-siswa');
            },
            child: Container(
              margin: EdgeInsets.only(top: 20),
              padding:
                  EdgeInsets.only(top: 10, left: 12, bottom: 14, right: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: backgroundColor6),
              height: 100,
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    FontAwesomeIcons.users,
                    size: 30,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Text(
                      "Siswa",
                      style: blackTextStyle.copyWith(
                        fontSize: 25,
                        fontWeight: semiBold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/daftar-tugas');
            },
            child: Container(
              margin: EdgeInsets.only(top: 20),
              padding:
                  EdgeInsets.only(top: 10, left: 12, bottom: 14, right: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: backgroundColor6),
              height: 100,
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    FontAwesomeIcons.bookOpen,
                    size: 30,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Text(
                      "Tugas",
                      style: blackTextStyle.copyWith(
                        fontSize: 25,
                        fontWeight: semiBold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/daftar-mapel');
            },
            child: Container(
              margin: EdgeInsets.only(top: 20),
              padding:
                  EdgeInsets.only(top: 10, left: 12, bottom: 14, right: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: backgroundColor6),
              height: 100,
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Icon(
                    FontAwesomeIcons.pencilAlt,
                    size: 30,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Text(
                      "Absensi",
                      style: blackTextStyle.copyWith(
                        fontSize: 25,
                        fontWeight: semiBold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      );
    }

    return Scaffold(
      backgroundColor: primaryColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header(),
                daftarDetailMapelTitle(),
                daftarDetailMapel()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
