import 'package:apps/model/guru/guru_model.dart';
import 'package:apps/pages/home_admin/navbar_admin.dart';
import 'package:apps/provider/guru/ajaran_provider.dart';
import 'package:apps/provider/guru/auth_guru_provider.dart';
import 'package:apps/widget/ajaran_nilai.dart';
import 'package:apps/widget/ajaran_nilaiAdmin.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';

import '../../theme.dart';

class TahunAjaranAdmin extends StatefulWidget {
  const TahunAjaranAdmin({Key key}) : super(key: key);

  @override
  _TahunAjaranAdminState createState() => _TahunAjaranAdminState();
}

class _TahunAjaranAdminState extends State<TahunAjaranAdmin> {
  ProgressDialog pr;
  @override
  Widget build(BuildContext context) {
    AjaranProvider ajaranProvider = Provider.of<AjaranProvider>(context);
    AuthGuruProvider authGuruProvider = Provider.of<AuthGuruProvider>(context);
    GuruModel guru = authGuruProvider.guru;
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

    Widget daftarMapel() {
      return Container(
        margin: EdgeInsets.only(
          top: 14,
        ),
        child: ajaranProvider.ajaran == null
            ? Text("tidak ada data")
            : Column(
                children: ajaranProvider.ajaran
                    .map((ajaran) => AjaranNilaiAdmin(ajaran))
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
