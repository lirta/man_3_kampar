import 'package:apps/pages/home_guru/navbar_guru.dart';
import 'package:apps/provider/guru/daftar_nilai_guru_provider.dart';
import 'package:apps/widget/daftar_nilai_keseluruhan_guru.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../theme.dart';

class DaftarNilaiKeseluruhanSiswaPage extends StatefulWidget {
  const DaftarNilaiKeseluruhanSiswaPage({ Key key }) : super(key: key);

  @override
  _DaftarNilaiKeseluruhanSiswaPageState createState() => _DaftarNilaiKeseluruhanSiswaPageState();
}

class _DaftarNilaiKeseluruhanSiswaPageState extends State<DaftarNilaiKeseluruhanSiswaPage> {
   @override
  Widget build(BuildContext context) {
    DaftarNilaiGuruProvider daftarNilaiGuruProvider = Provider.of<DaftarNilaiGuruProvider>(context);
    // JadwalModel jadwal = jadwalProvider.jadwal;
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final _id_kls = args['id_kelas'];
    final _id_mapel = args['id_mapel'];
    final _mapel = args['mapel'];
    Widget header() {
      return AppBar(
        backgroundColor: birumudaColor,
        elevation: 0,
        centerTitle: true,
        // automaticallyImplyLeading: false,
        title: Text('Nilai $_mapel'),
      );
    }

    

    Widget daftarMapel() {
      return Container(
        margin: EdgeInsets.only(
          top: 14,
        ),
        child: daftarNilaiGuruProvider.nilai == null
            ? Text("tidak ada data")
            : Column(
                children: daftarNilaiGuruProvider.nilai
                    .map((nilai) => DaftarNilaiKeseluruhanGuru(nilai))
                    .toList(),
              ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor6,
      resizeToAvoidBottomInset: false,
      appBar: header(),
      drawer: NavbarGuru(),
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