import 'package:apps/pages/home_guru/navbar_guru.dart';
import 'package:apps/provider/guru/daftar_siswa_perkelas_provider.dart';
import 'package:apps/theme.dart';
import 'package:apps/widget/daftar_siswa.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DaftarSiswaPage extends StatelessWidget {
  const DaftarSiswaPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final _id_mapel = args['id_mapel'];
    DaftarSiswaPerkelasProvider daftarSiswaPerkelasProvider =
        Provider.of<DaftarSiswaPerkelasProvider>(context);
    Widget header() {
      return AppBar(
        backgroundColor: birumudaColor,
        elevation: 0,
        centerTitle: true,
        // automaticallyImplyLeading: false,
        title: Text('Daftar Siswa guru'),
      );
    }

    Widget daftarSiswaTitle() {
      return Container(
        margin: EdgeInsets.only(
          top: 10,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Row(
          children: [
            Text(
              "Daftar Siswa /",
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

    Widget daftarSiswa() {
      return Container(
        margin: EdgeInsets.only(
          top: 14,
        ),
        child: daftarSiswaPerkelasProvider.siswa == null
            ? Text("Tidak ada siswa")
            : Column(
                children: daftarSiswaPerkelasProvider.siswa
                    .map((siswa) => DaftarSiswa(siswa, _id_mapel))
                    .toList(),
                //  [
                //   DaftarSiswa(),
                //   DaftarSiswa(),
                //   DaftarSiswa(),
                //   DaftarSiswa(),
                //   DaftarSiswa(),
                //   DaftarSiswa(),
                //   DaftarSiswa(),
                //   DaftarSiswa(),
                //   DaftarSiswa(),
                // ]
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
              children: [ daftarSiswa()],
            ),
          ),
        ),
      ),
    );
  }
}
