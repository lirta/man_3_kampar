import 'package:apps/provider/siswa/siswa_daftar_mapel_provider.dart';
import 'package:apps/widget/siswa_daftar_mapel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../theme.dart';

class SiswaDaftarMapelPage extends StatefulWidget {
  const SiswaDaftarMapelPage({Key key}) : super(key: key);

  @override
  _SiswaDaftarMapelPageState createState() => _SiswaDaftarMapelPageState();
}

class _SiswaDaftarMapelPageState extends State<SiswaDaftarMapelPage> {
  @override
  Widget build(BuildContext context) {
    SiswaDaftarMapelProvider siswaDaftarMapelProvider =
        Provider.of<SiswaDaftarMapelProvider>(context);
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
        child: siswaDaftarMapelProvider.mapel == null
            ? Text("tidak ada jadwal")
            : Column(
                children: siswaDaftarMapelProvider.mapel
                    .map((mapel) => SiswaDaftarMapel(mapel))
                    .toList(),
              ),
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
              children: [daftarMapelTitle(), daftarMapel()],
            ),
          ),
        ),
      ),
    );
  }
}
