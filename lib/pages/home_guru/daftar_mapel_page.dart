import 'package:apps/pages/home_guru/navbar_guru.dart';
import 'package:apps/provider/guru/jadwal_provider.dart';
import 'package:apps/theme.dart';
import 'package:apps/widget/daftar_mapel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DaftarMapelPage extends StatefulWidget {
  const DaftarMapelPage({Key key}) : super(key: key);

  @override
  _DaftarMapelPageState createState() => _DaftarMapelPageState();
}

class _DaftarMapelPageState extends State<DaftarMapelPage> {
  @override
  Widget build(BuildContext context) {
    JadwalProvider jadwalProvider = Provider.of<JadwalProvider>(context);
    // JadwalModel jadwal = jadwalProvider.jadwal;
    Widget header() {
      return AppBar(
        backgroundColor: birumudaColor,
        elevation: 0,
        centerTitle: true,
        // automaticallyImplyLeading: false,
        title: Text('Daftar Matapelajaran'),
      );
    }

    Widget daftarMapelTitle() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Row(
          children: [
            Text(
              "Daftar Mapel/",
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

    Widget daftarMapel() {
      return Container(
        margin: EdgeInsets.only(
          top: 14,
        ),
        child: jadwalProvider.jadwal == null
            ? Text("tidak ada jadwal")
            : Column(
                children: jadwalProvider.jadwal
                    .map((jadwal) => DaftarMapel(jadwal))
                    .toList(),
              ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor6,
      resizeToAvoidBottomInset: false,
      appBar: header(),
      drawer: NavbarGuru(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [daftarMapel()],
            ),
          ),
        ),
      ),
    );
  }
}
