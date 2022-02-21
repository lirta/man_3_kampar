import 'package:apps/model/siswa/siswa_model.dart';
import 'package:apps/pages/home_siswa/navbar.dart';
import 'package:apps/provider/siswa/auth_siswa_provider.dart';
import 'package:apps/provider/siswa/daftar_absen_siswa_provider.dart';
import 'package:apps/service/daftar_absen_siswa.dart';
import 'package:apps/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DaftarAbsenSiswaPage extends StatefulWidget {
  const DaftarAbsenSiswaPage({Key key}) : super(key: key);

  @override
  _DaftarAbsenSiswaPageState createState() => _DaftarAbsenSiswaPageState();
}

class _DaftarAbsenSiswaPageState extends State<DaftarAbsenSiswaPage> {
  @override
  Widget build(BuildContext context) {
    DaftarAbsenSiswaProvider daftarAbsenSiswaProvider =
        Provider.of<DaftarAbsenSiswaProvider>(context);
    AuthSiswaProvider authSiswaProvider =
        Provider.of<AuthSiswaProvider>(context);
    SiswaModel siswa = authSiswaProvider.siswa;
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final nama = args['nama'];
    final nis = args['nis'];
    final _mapel = args['mapel'];
    Widget header() {
      return AppBar(
        backgroundColor: birumudaColor,
        elevation: 0,
        centerTitle: true,
        // automaticallyImplyLeading: false,
        title: Text('Absensi ' + _mapel),
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
                Navigator.pushNamed(context, '/home-siswa');
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
                siswa.nama,
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
                siswa.nis,
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
        child: daftarAbsenSiswaProvider.absen_siswa == null
            ? Text("belum ada Data Absen")
            : Column(
                children: daftarAbsenSiswaProvider.absen_siswa
                    .map((absen_siswa) => DaftarSiswaAbsen(absen_siswa))
                    .toList(),
                //  [
                //   KehadiranSiswa(),
                //   KehadiranSiswa(),
                //   KehadiranSiswa(),
                //   KehadiranSiswa(),
                //   KehadiranSiswa(),
                //   KehadiranSiswa(),
                //   KehadiranSiswa(),
                //   KehadiranSiswa(),
                //   KehadiranSiswa(),
                // ]
              ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor6,
      resizeToAvoidBottomInset: false,
      appBar: header(),
      drawer: NavbarSiswa(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [detailTugas()],
            ),
          ),
        ),
      ),
    );
  }
}
