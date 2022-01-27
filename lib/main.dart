import 'package:apps/pages/home_guru/daftar_mapel_page.dart';
import 'package:apps/pages/home_guru/daftar_siswa_page.dart';
import 'package:apps/pages/home_guru/daftar_tugas_page.dart';
import 'package:apps/pages/home_guru/detail_mapel_page.dart';
import 'package:apps/pages/home_guru/main_page.dart';
import 'package:apps/pages/sign_in_page.dart';
import 'package:apps/pages/sign_up_page.dart';
import 'package:apps/pages/splash_page.dart';
import 'package:apps/provider/page_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/home_guru/detail_tugas_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => PageProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const SplashPage(),
          '/sign-in': (context) => const SignInPage(),
          '/sign-up': (context) => const SingUpPage(),
          '/home': (context) => const MainPage(),
          '/daftar-mapel': (context) => const DaftarMapelPage(),
          '/detail-mapel': (context) => const DetailMapelPage(),
          '/daftar-siswa': (context) => const DaftarSiswaPage(),
          '/daftar-tugas': (context) => const DaftarTugasPage(),
          '/detail-tugas': (context) => const DetailTugasPage(),
        },
        // home: SplashPage(),
      ),
    );
  }
}
