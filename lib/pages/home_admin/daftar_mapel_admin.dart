import 'package:apps/pages/home_admin/navbar_admin.dart';
import 'package:apps/provider/guru/jadwal_provider.dart';
import 'package:apps/widget/admin_daftar_mapel.dart';
import 'package:apps/widget/guru_daftar_mapel_nilai.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';

import '../../theme.dart';

class DaftarMapelNilaiAdminPage extends StatefulWidget {
  const DaftarMapelNilaiAdminPage({Key key}) : super(key: key);

  @override
  _DaftarMapelNilaiAdminPageState createState() =>
      _DaftarMapelNilaiAdminPageState();
}

class _DaftarMapelNilaiAdminPageState extends State<DaftarMapelNilaiAdminPage> {
  ProgressDialog pr;
  @override
  Widget build(BuildContext context) {
    JadwalProvider jadwalProvider = Provider.of<JadwalProvider>(context);
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final id_ajaran = args['id_ajaran'];
    final ajaran = args['ajaran'];
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
        title: Text('Pilih Matapelajaran'),
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
        child: jadwalProvider.jadwaladmin == null
            ? Text("tidak ada jadwal")
            : Column(
                children: jadwalProvider.jadwaladmin
                    .map((jadwaladmin) => AdminDaftarMapel(jadwaladmin))
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
