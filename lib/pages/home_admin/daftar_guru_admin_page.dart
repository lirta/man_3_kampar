import 'package:apps/pages/home_admin/navbar_admin.dart';
import 'package:apps/provider/admin_profider.dart';
import 'package:apps/widget/admin_guru.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../theme.dart';

class DaftarGuruAdminPage extends StatelessWidget {
  const DaftarGuruAdminPage({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AdminProvider adminProvider =
        Provider.of<AdminProvider>(context);
    Widget header() {
      return AppBar(
        backgroundColor: birumudaColor,
        elevation: 0,
        centerTitle: true,
        // automaticallyImplyLeading: false,
        title: Text('Daftar Guru'),
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

    

    Widget detailTugas() {
      return Container(
        margin: EdgeInsets.only(
          top: 14,
        ),
        child: adminProvider.guru == null
            ? Text("belum ada Data Absen")
            : Column(
                children: adminProvider.guru
                    .map((guru) => AdminGuru(guru))
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
      drawer: NavbarAdmin(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [ detailTugas()],
            ),
          ),
        ),
      ),
    );
  }
}