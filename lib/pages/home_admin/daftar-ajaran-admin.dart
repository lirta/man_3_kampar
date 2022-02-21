import 'package:apps/model/admin/admin_model.dart';
import 'package:apps/pages/home_admin/navbar_admin.dart';
import 'package:apps/provider/guru/ajaran_provider.dart';
import 'package:apps/provider/guru/auth_guru_provider.dart';
import 'package:apps/widget/ajaran_kalender.dart';
import 'package:apps/widget/daftar_ajaran_admin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';

import '../../theme.dart';

class DaftarAjaranAdminPage extends StatefulWidget {
  const DaftarAjaranAdminPage({ Key key }) : super(key: key);

  @override
  _DaftarAjaranAdminPageState createState() => _DaftarAjaranAdminPageState();
}

class _DaftarAjaranAdminPageState extends State<DaftarAjaranAdminPage> {
  ProgressDialog pr;
  @override
  Widget build(BuildContext context) {
    AjaranProvider ajaranProvider = Provider.of<AjaranProvider>(context);
    AuthGuruProvider authGuruProvider = Provider.of<AuthGuruProvider>(context);
    AdminModel admin = authGuruProvider.admin;
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
    Widget header() {
      return AppBar(
        backgroundColor: birumudaColor,
        elevation: 0,
        centerTitle: true,
        // automaticallyImplyLeading: false,
        title: Text('Pilih Tahun Ajaran'),
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

    Widget daftarMapel() {
      return Container(
        margin: EdgeInsets.only(
          top: 14,
        ),
        child: ajaranProvider.ajaran == null
            ? Text("tidak ada data")
            : Column(
                children: ajaranProvider.ajaran
                    .map((ajaran) => DaftarAjaranAdmin(ajaran))
                    .toList(),
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
              children: [daftarMapel()],
            ),
          ),
        ),
      ),
    );
  }
}