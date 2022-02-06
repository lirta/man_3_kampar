import 'package:apps/pages/home_guru/add_tugas_page.dart';
import 'package:apps/pages/home_guru/daftar_absensi_page.dart';
import 'package:apps/pages/home_guru/daftar_mapel_page.dart';
import 'package:apps/pages/home_guru/daftar_siswa_page.dart';
import 'package:apps/pages/home_guru/daftar_tugas_page.dart';
import 'package:apps/pages/home_guru/datail_absen_siswa.dart';
import 'package:apps/pages/home_guru/detail_absen_siswa_page.dart';
import 'package:apps/pages/home_guru/detail_mapel_page.dart';
import 'package:apps/pages/home_guru/main_page.dart';
import 'package:apps/pages/home_guru/tugas_page.dart';
import 'package:apps/pages/home_siswa/daftar_absen_siswa_page.dart';
import 'package:apps/pages/home_siswa/daftar_tugas_siswa_page.dart';
import 'package:apps/pages/home_siswa/detail_tugas_siswa_page.dart';
import 'package:apps/pages/home_siswa/main_page_siswa.dart';
import 'package:apps/pages/home_siswa/siswa_daftar_mapel_page.dart';
import 'package:apps/pages/sign_in_page.dart';
import 'package:apps/pages/sign_in_siswa_page.dart';
import 'package:apps/pages/sign_up_page.dart';
import 'package:apps/pages/splash_login.dart';
import 'package:apps/pages/splash_page.dart';
import 'package:apps/provider/guru/absen_siswa_provider.dart';
import 'package:apps/provider/guru/auth_guru_provider.dart';
import 'package:apps/provider/guru/daftar_siswa_perkelas_provider.dart';
import 'package:apps/provider/guru/daftar_tugas_provider.dart';
import 'package:apps/provider/guru/jadwal_provider.dart';
import 'package:apps/provider/guru/jawaban_provider.dart';
import 'package:apps/provider/page_provider.dart';
import 'package:apps/provider/siswa/auth_siswa_provider.dart';
import 'package:apps/provider/siswa/daftar_absen_siswa_provider.dart';
import 'package:apps/provider/siswa/daftar_tugas_siswa_provider.dart';
import 'package:apps/provider/siswa/siswa_daftar_mapel_provider.dart';
import 'package:apps/provider/siswa/siswa_jawaban_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/home_guru/detail_tugas_page.dart';
import 'pages/home_siswa/detail_mapel_siswa_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PageProvider()),
        ChangeNotifierProvider(create: (context) => SiswaJawabanProvider()),
        ChangeNotifierProvider(create: (context) => DaftarAbsenSiswaProvider()),
        ChangeNotifierProvider(create: (context) => DaftarTugasSiswaProvider()),
        ChangeNotifierProvider(create: (context) => SiswaDaftarMapelProvider()),
        ChangeNotifierProvider(create: (context) => AuthSiswaProvider()),
        ChangeNotifierProvider(create: (context) => AbsenSiswaProvider()),
        ChangeNotifierProvider(create: (context) => DaftarJawabanProvider()),
        ChangeNotifierProvider(create: (context) => DaftarTugasProvider()),
        ChangeNotifierProvider(
            create: (context) => DaftarSiswaPerkelasProvider()),
        ChangeNotifierProvider(create: (context) => JadwalProvider()),
        ChangeNotifierProvider(
          create: (context) => AuthGuruProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/splash-login': (context) => const SplashLoginPage(),
          '/sign-in': (context) => const SignInPage(),
          '/sign-in-siswa': (context) => const SignInSiswaPage(),
          '/sign-up': (context) => const SingUpPage(),
          '/home-siswa': (context) => const MainPageSiswa(),
          '/daftar-mapel-siswa': (context) => const SiswaDaftarMapelPage(),
          '/detail-mapel-siswa': (context) => const DetailMapelSiswaPage(),
          '/daftar-tugas-siswa': (context) => const DaftarTugasSiswaPage(),
          '/detail-absen-siswa': (context) => const DaftarAbsenSiswaPage(),
          '/detail-tugas-siswa': (context) => const DetailTugasSiswaPage(),
          //root tugas guru
          '/home': (context) => const MainPage(),
          '/daftar-mapel': (context) => const DaftarMapelPage(),
          '/detail-mapel': (context) => const DetailMapelPage(),
          '/daftar-siswa': (context) => const DaftarSiswaPage(),
          '/daftar-absensi': (context) => const DaftarAbsensiPage(),
          '/detail-absensi': (context) => const DetailAbsenSiswaPage(),
          '/tugas': (context) => const TugasPage(),
          '/daftar-tugas': (context) => const DaftarTugasPage(),
          '/detail-tugas': (context) => const DetailTugasPage(),
          '/add-tugas': (context) => const AddTugasPage(),
        },
        // home: SplashPage(),
      ),
    );
  }
}
