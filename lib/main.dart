import 'package:apps/model/guru/ajaran_model.dart';
import 'package:apps/pages/home_guru/add_tugas_page.dart';
import 'package:apps/pages/home_guru/daftar_absensi_page.dart';
import 'package:apps/pages/home_guru/daftar_ajaran_daftar.dart';
import 'package:apps/pages/home_guru/daftar_ajaran_kalender.dart';
import 'package:apps/pages/home_guru/daftar_mapel_absen_guru.dart';
import 'package:apps/pages/home_guru/daftar_mapel_nilai_guru.dart';
import 'package:apps/pages/home_guru/daftar_mapel_page.dart';
import 'package:apps/pages/home_guru/daftar_mapel_soal_guru.dart';
import 'package:apps/pages/home_guru/daftar_siswa_page.dart';
import 'package:apps/pages/home_guru/daftar_tugas_page.dart';
import 'package:apps/pages/home_guru/datail_absen_siswa.dart';
import 'package:apps/pages/home_guru/detail_absen_siswa_page.dart';
import 'package:apps/pages/home_guru/detail_mapel_page.dart';
import 'package:apps/pages/home_guru/home_page.dart';
import 'package:apps/pages/home_guru/index_guru.dart';
import 'package:apps/pages/home_guru/main_page.dart';
import 'package:apps/pages/home_guru/tugas_page.dart';
import 'package:apps/pages/home_siswa/daftar_absen_siswa_page.dart';
import 'package:apps/pages/home_siswa/daftar_mapel_absen.dart';
import 'package:apps/pages/home_siswa/daftar_mapel_kalender.dart';
import 'package:apps/pages/home_siswa/daftar_mapel_nilai.dart';
import 'package:apps/pages/home_siswa/daftar_mapel_soal.dart';
import 'package:apps/pages/home_siswa/daftar_nilai_siswa_page.dart';
import 'package:apps/pages/home_siswa/daftar_tugas_siswa_page.dart';
import 'package:apps/pages/home_siswa/detail_tugas_siswa_page.dart';
import 'package:apps/pages/home_siswa/home_siswa_page.dart';
import 'package:apps/pages/home_siswa/index_siswa.dart';
import 'package:apps/pages/home_siswa/main_page_siswa.dart';
import 'package:apps/pages/home_siswa/siswa_daftar_mapel_page.dart';
import 'package:apps/pages/sign_in_page.dart';
import 'package:apps/pages/sign_in_siswa_page.dart';
import 'package:apps/pages/sign_up_page.dart';
import 'package:apps/pages/splash_login.dart';
import 'package:apps/pages/splash_page.dart';
import 'package:apps/provider/guru/absen_siswa_provider.dart';
import 'package:apps/provider/guru/ajaran_provider.dart';
import 'package:apps/provider/guru/auth_guru_provider.dart';
import 'package:apps/provider/guru/daftar_siswa_perkelas_provider.dart';
import 'package:apps/provider/guru/daftar_tugas_provider.dart';
import 'package:apps/provider/guru/jadwal_provider.dart';
import 'package:apps/provider/guru/jawaban_provider.dart';
import 'package:apps/provider/kalender_provider.dart';
import 'package:apps/provider/page_provider.dart';
import 'package:apps/provider/siswa/auth_siswa_provider.dart';
import 'package:apps/provider/siswa/daftar_absen_siswa_provider.dart';
import 'package:apps/provider/siswa/daftar_nilai_provider.dart';
import 'package:apps/provider/siswa/daftar_tugas_siswa_provider.dart';
import 'package:apps/provider/siswa/nilai_provider.dart';
import 'package:apps/provider/siswa/siswa_daftar_mapel_provider.dart';
import 'package:apps/provider/siswa/siswa_jawaban_provider.dart';
import 'package:apps/widget/siswa_daftar_mapel_soal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/home_guru/detail_tugas_page.dart';
import 'pages/home_siswa/detail_mapel_siswa_page.dart';
import 'widget/splash_screen.dart';

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
        ChangeNotifierProvider(create: (context) => AjaranProvider()),
        ChangeNotifierProvider(create: (context) => NilaiProvider()),
        ChangeNotifierProvider(create: (context) => KalenderProvider()),
        ChangeNotifierProvider(create: (context) => DaftarNilaiProvider()),
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
          // '/sc': (context) => SplashScreen(),
          '/splash-login': (context) => const SplashLoginPage(),
          '/sign-in': (context) => const SignInPage(),
          '/sign-in-siswa': (context) => const SignInSiswaPage(),
          '/nilai-siswa': (context) => const DaftarNilaiSiswaPage(),
          '/index': (context) => const IndexSiswa(),
          '/home-siswa': (context) => const HomeSiswaPage(),
          '/daftar-mapel-siswa': (context) => const SiswaDaftarMapelPage(),
          '/daftar-mapel-absen-siswa': (context) => const DaftarMapelAbsen(),
          '/daftar-mapel-soal-siswa': (context) => const DaftarMapelSoal(),
          '/daftar-mapel-nilai-siswa': (context) =>
              const DaftarMapelNilaiSisa(),
          '/daftar-mapel-kalender-siswa': (context) =>
              const DaftarMapelKalenderSiswa(),
          '/detail-mapel-siswa': (context) => const DetailMapelSiswaPage(),
          '/daftar-tugas-siswa': (context) => const DaftarTugasSiswaPage(),
          '/detail-absen-siswa': (context) => const DaftarAbsenSiswaPage(),
          '/detail-tugas-siswa': (context) => const DetailTugasSiswaPage(),
          //root tugas guru
          '/index-guru': (context) => const IndexGuru(),
          '/home': (context) => const HomePage(),
          '/daftar-mapel-soal': (context) => const DaftarMapelSoalGuru(),
          '/daftar-mapel-absen': (context) => const DaftarMapelAbsenGuru(),
          '/daftar-mapel-nilai': (context) => const DaftarMapelNilaiGuru(),
          '/daftar-mapel': (context) => const DaftarMapelPage(),
          '/detail-mapel': (context) => const DetailMapelPage(),
          '/daftar-siswa': (context) => const DaftarSiswaPage(),
          '/daftar-absensi': (context) => const DaftarAbsensiPage(),
          '/detail-absensi': (context) => const DetailAbsenSiswaPage(),
          '/tugas': (context) => const TugasPage(),
          '/daftar-tugas': (context) => const DaftarTugasPage(),
          '/detail-tugas': (context) => const DetailTugasPage(),
          '/add-tugas': (context) => const AddTugasPage(),
          '/daftar-ajaran-kalender': (context) =>
              const DaftarAjaranKalenderPage(),
          '/daftar-ajaran-daftar': (context) => const DaftarAjaranDaftarPage(),
        },
        // home: SplashPage(),
      ),
    );
  }
}
