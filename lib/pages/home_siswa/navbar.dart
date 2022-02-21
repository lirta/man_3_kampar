import 'package:apps/model/siswa/siswa_model.dart';
import 'package:apps/provider/siswa/auth_siswa_provider.dart';
import 'package:apps/provider/siswa/siswa_daftar_mapel_provider.dart';
import 'package:apps/service/server.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavbarSiswa extends StatelessWidget {
  // const NavbarSiswa({Key key}) : super(key: key);
  ProgressDialog pr;
  @override
  Widget build(BuildContext context) {
    SiswaDaftarMapelProvider siswaDaftarMapelProvider =
        Provider.of<SiswaDaftarMapelProvider>(context);
    AuthSiswaProvider authSiswaProvider =
        Provider.of<AuthSiswaProvider>(context);
    SiswaModel siswa = authSiswaProvider.siswa;
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
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(siswa.nama),
            accountEmail: Text(siswa.nis),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  fotosiswaUrl + siswa.foto,
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg')),
            ),
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.chartArea),
            title: Text('Dashboard'),
            onTap: () {
              Navigator.pushNamed(context, '/index');
            },
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.laptopCode),
            title: Text('Jadwal'),
            onTap: () {
              Navigator.pushNamed(context, '/home-siswa');
            },
          ),
          ListTile(
            leading: Icon(FontAwesomeIcons.fileAlt),
            title: Text('Soal'),
            onTap: () async {
              pr.show();
              if (await siswaDaftarMapelProvider.jadwal(id: siswa.id_kelas)) {
                pr.hide();
                Navigator.pushNamed(context, '/daftar-mapel-soal-siswa');
              }
            },
          ),
          ListTile(
              leading: Icon(FontAwesomeIcons.bookmark),
              title: Text('Absensi'),
              onTap: () async {
                pr.show();
                if (await siswaDaftarMapelProvider.jadwal(id: siswa.id_kelas)) {
                  pr.hide();
                  Navigator.pushNamed(context, '/daftar-mapel-absen-siswa');
                }
              }),
          ListTile(
            leading: Icon(FontAwesomeIcons.bookOpen),
            title: Text('Nilai'),
          ),
          Divider(),
          // ListTile(
          //   leading: Icon(Icons.settings),
          //   title: Text('Settings'),
          //   onTap: () => null,
          // ),
          // ListTile(
          //   leading: Icon(Icons.description),
          //   title: Text('Policies'),
          //   onTap: () => null,
          // ),
          // Divider(),
          ListTile(
            title: Text('Sign Out'),
            leading: Icon(Icons.exit_to_app),
            onTap: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.remove("id");
              prefs.setBool("is_login", false);
              Navigator.pushNamedAndRemoveUntil(
                  context, '/splash-login', (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
