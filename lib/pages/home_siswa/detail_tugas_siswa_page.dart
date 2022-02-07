import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:apps/model/siswa/siswa_jawaban_model.dart';
import 'package:apps/model/siswa/siswa_model.dart';
import 'package:apps/provider/siswa/auth_siswa_provider.dart';
import 'package:apps/provider/siswa/siswa_jawaban_provider.dart';
import 'package:apps/service/server.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

import '../../theme.dart';

class DetailTugasSiswaPage extends StatefulWidget {
  const DetailTugasSiswaPage({Key key}) : super(key: key);

  @override
  _DetailTugasSiswaPageState createState() => _DetailTugasSiswaPageState();
}

class _DetailTugasSiswaPageState extends State<DetailTugasSiswaPage> {
  File filetugas;
  String nameFile;
  Future plhFile() async {
    var pickFile = await FilePicker.platform.pickFiles();
    final file = pickFile.files.first;
    print('name : ${file.name}');
    print('bytes : ${file.bytes}');
    print('size : ${file.size}');
    print('Extension : ${file.extension}');
    print('Path : ${file.path}');
    setState(() {
      filetugas = File(file.path);
      nameFile = file.name;
    });
  }

  @override
  Widget build(BuildContext context) {
    AuthSiswaProvider authSiswaProvider =
        Provider.of<AuthSiswaProvider>(context);
    SiswaModel siswa = authSiswaProvider.siswa;
    final args =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final _jenis = args['jenis'];
    final _file = args['file'];
    final _limit = args['tgl_kumpel'];
    final _id_soal = args['id_soal'];
    SiswaJawabanProvider siswaJawabanProvider =
        Provider.of<SiswaJawabanProvider>(context);
    SiswaJawabanModel jawaban_siswa = siswaJawabanProvider.jawaban_siswa;
    Widget header() {
      return AppBar(
        backgroundColor: birumudaColor,
        elevation: 0,
        centerTitle: true,
        // automaticallyImplyLeading: false,
        title: Text('Detail Tugas'),
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
              "Detail Tugas /",
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

    Widget tugas() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Detail Tugas",
              style: primaryTextStyle.copyWith(fontWeight: semiBold),
            ),
            Divider(
              thickness: 1,
              color: Color(0Xff2e3141),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Jenis Tugas',
              style: primaryTextStyle.copyWith(fontWeight: medium),
              maxLines: 3,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              _jenis,
              style: subtitleTextStyle.copyWith(
                fontSize: 12,
                // fontWeight: medium
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Tanggal Di Kumpul',
              style: primaryTextStyle.copyWith(fontWeight: medium),
              maxLines: 3,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              _limit,
              style: subtitleTextStyle.copyWith(
                fontSize: 12,
                // fontWeight: medium
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'File Tugas',
              style: primaryTextStyle.copyWith(fontWeight: medium),
              maxLines: 3,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              _file,
              style: subtitleTextStyle.copyWith(
                fontSize: 12,
                // fontWeight: medium
              ),
            ),
          ],
        ),
      );
    }

    Widget tugasJawaban() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: birutuaColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Detail Jawaban",
              style: primaryTextStyle.copyWith(fontWeight: semiBold),
            ),
            Divider(
              thickness: 1,
              color: Color(0Xff2e3141),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'File',
              style: subtitleTextStyle.copyWith(fontWeight: medium),
              maxLines: 3,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              jawaban_siswa.jawaban,
              style: primaryTextStyle.copyWith(
                fontSize: 12,
                // fontWeight: medium
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'Nilai',
              style: subtitleTextStyle.copyWith(fontWeight: medium),
              maxLines: 3,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              jawaban_siswa.nilai == null || jawaban_siswa.nilai == ""
                  ? 'Belum Di Nilai'
                  : jawaban_siswa.nilai,
              style: primaryTextStyle.copyWith(
                fontSize: 12,
                // fontWeight: medium
              ),
            ),
            SizedBox(
              height: 5,
            ),
          ],
        ),
      );
    }

    handleAdd() async {
      if (!(filetugas != null)) {
        Flushbar(
          duration: Duration(seconds: 4),
          flushbarPosition: FlushbarPosition.TOP,
          backgroundColor: Color(0xffff5c83),
          message: 'Pilih file',
        ).show(context);
      } else {
        var nis = siswa.nis;
        var url = '$baseUrl' + '/soal/$_id_soal/jawaban/$nis';
        print(url);
        var uri = Uri.parse(url);
        var request = new http.MultipartRequest("POST", uri);
        var multipartFile =
            await http.MultipartFile.fromPath('file_soal', filetugas.path);
        request.files.add(multipartFile);
        var response = await request.send();
        print(response.request);
        if (response.statusCode == 200) {
          print("berhasil");
          Navigator.of(context).pop();
        } else {
          Flushbar(
            duration: Duration(seconds: 4),
            flushbarPosition: FlushbarPosition.TOP,
            backgroundColor: Color(0xffff5c83),
            message: 'Gagal Upload tugas, Silahkan cobalagi nantik',
          ).show(context);
        }
      }
    }

    Widget filejawaban() {
      return Container(
        height: 100,
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: GestureDetector(
          onTap: () {
            plhFile();
          },
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    FontAwesomeIcons.fileImage,
                    color: secondaryColor,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text('Pilih file tugas',
                      style: priceTextStyle.copyWith(
                          fontSize: 18, fontWeight: semiBold)),
                ],
              ),
              SizedBox(
                width: 15,
              ),
              nameFile == null
                  ? Container()
                  : Text(nameFile,
                      style: priceTextStyle.copyWith(
                          fontSize: 18, fontWeight: semiBold))
            ],
          ),
        ),
      );
    }

    Widget _buildPopupDialog(BuildContext context) {
      return new AlertDialog(
        title: Text("Upload Jawaban"),
        content: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[filejawaban()],
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              // addnilai();
            },
            textColor: Theme.of(context).primaryColor,
            child: const Text('Submit'),
          ),
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            textColor: Theme.of(context).primaryColor,
            child: Icon(FontAwesomeIcons.windowClose),
          ),
        ],
      );
    }

    Widget signUpButton() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: TextButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) => _buildPopupDialog(context),
            );
          },
          style: TextButton.styleFrom(
            backgroundColor: birumudaColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          child: Text(
            'upload Tugas',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
        ),
      );
    }

    // Widget detailTugas() {
    //   return Container(
    //     margin: EdgeInsets.only(
    //       top: 14,
    //     ),
    //     child: daftarJawabanProvider.jawaban == null
    //         ? Text("Tidah ada data Jawaban")
    //         : Column(
    //             children: daftarJawabanProvider.jawaban
    //                 .map((jawaban) => TugasSiswa(jawaban))
    //                 .toList(),
    //             //  [
    //             //   TugasSiswa(),
    //             //   TugasSiswa(),
    //             //   TugasSiswa(),
    //             //   TugasSiswa(),
    //             //   TugasSiswa(),
    //             //   TugasSiswa(),
    //             //   TugasSiswa(),
    //             //   TugasSiswa(),
    //             //   // DaftarTugas(),
    //             // ]
    //           ),
    //   );
    // }

    return Scaffold(
      backgroundColor: primaryColor,
      resizeToAvoidBottomInset: false,
      appBar: header(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                detailTugasTitle(),
                tugas(),
                jawaban_siswa != null ? tugasJawaban() : signUpButton()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
