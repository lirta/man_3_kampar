import 'package:apps/model/guru/guru_model.dart';
import 'package:apps/pages/home_admin/navbar_admin.dart';
import 'package:apps/pages/home_guru/navbar_guru.dart';
import 'package:apps/provider/admin_profider.dart';
import 'package:apps/provider/guru/ajaran_provider.dart';
import 'package:apps/provider/guru/auth_guru_provider.dart';
import 'package:apps/provider/guru/jadwal_provider.dart';
import 'package:apps/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';

class IndexAdmin extends StatefulWidget {
  const IndexAdmin({Key key}) : super(key: key);

  @override
  _IndexAdminState createState() => _IndexAdminState();
}

class _IndexAdminState extends State<IndexAdmin> {
  ProgressDialog pr;
  @override
  Widget build(BuildContext context) {
    AdminProvider adminProvider = Provider.of<AdminProvider>(context);
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

    Card makeDashboardJadwal() {
      return Card(
          elevation: 1.0,
          margin: new EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: birutuaColor,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 17),
                      blurRadius: 23,
                      spreadRadius: -13,
                      color: blackColor)
                ]),
            child: new InkWell(
              onTap: () async {
                pr.show();
                if (await adminProvider.get_siswa()) {
                  pr.hide();
                  Navigator.pushNamed(context, '/daftar-siswa-admin');
                } else {
                  pr.hide();
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                verticalDirection: VerticalDirection.down,
                children: <Widget>[
                  SizedBox(height: 50.0),
                  Center(
                      child: Icon(
                    FontAwesomeIcons.laptopCode,
                    size: 40.0,
                    color: Colors.black,
                  )),
                  SizedBox(height: 20.0),
                  new Center(
                    child: new Text('Change \nPasswoard \nSiswa',
                        style:
                            new TextStyle(fontSize: 18.0, color: Colors.black)),
                  )
                ],
              ),
            ),
          ));
    }

    Card makeDashboardSoal() {
      return Card(
          elevation: 1.0,
          margin: new EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: birutuaColor,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 17),
                      blurRadius: 23,
                      spreadRadius: -13,
                      color: blackColor)
                ]),
            child: new InkWell(
              onTap: () async {
                pr.show();
                if (await adminProvider.get_siswa()) {
                  pr.hide();
                  Navigator.pushNamed(context, '/daftar-siswa-admin');
                } else {
                  pr.hide();
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                verticalDirection: VerticalDirection.down,
                children: <Widget>[
                  SizedBox(height: 50.0),
                  Center(
                      child: Icon(
                    FontAwesomeIcons.laptopCode,
                    size: 40.0,
                    color: Colors.black,
                  )),
                  SizedBox(height: 20.0),
                  new Center(
                    child: new Text('Change \nPasswoard \nGuru',
                        style:
                            new TextStyle(fontSize: 18.0, color: Colors.black)),
                  )
                ],
              ),
            ),
          ));
    }
    Card makeDashboardKalender() {
      return Card(
          elevation: 1.0,
          margin: new EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: birutuaColor,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 17),
                      blurRadius: 23,
                      spreadRadius: -13,
                      color: blackColor)
                ]),
            child: new InkWell(
              onTap: () async {
                pr.show();
                if (await ajaranProvider.getajaran()) {
                  pr.hide();
                  Navigator.pushNamed(context, '/ajaran-kalender-admin');
                } else {
                  pr.hide();
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                verticalDirection: VerticalDirection.down,
                children: <Widget>[
                  SizedBox(height: 50.0),
                  Center(
                      child: Icon(
                    FontAwesomeIcons.calendarDay,
                    size: 40.0,
                    color: Colors.black,
                  )),
                  SizedBox(height: 20.0),
                  new Center(
                    child: new Text('Kalender \nAkademis',
                        style:
                            new TextStyle(fontSize: 18.0, color: Colors.black)),
                  )
                ],
              ),
            ),
          ));
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: biruColor,
        centerTitle: true,
        title: Text("Dashboard Amin"),
      ),
      drawer: NavbarAdmin(),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
        child: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(3.0),
          children: <Widget>[
            makeDashboardJadwal(),
            makeDashboardSoal(),
            makeDashboardKalender()
          ],
        ),
      ),

      // child: Column(
      //   children: [header()],
      // ),
    );
  }
}
