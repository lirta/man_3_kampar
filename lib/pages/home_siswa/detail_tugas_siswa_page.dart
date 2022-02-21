import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:apps/model/siswa/siswa_jawaban_model.dart';
import 'package:apps/model/siswa/siswa_model.dart';
import 'package:apps/pages/home_siswa/navbar.dart';
import 'package:apps/provider/siswa/auth_siswa_provider.dart';
import 'package:apps/provider/siswa/siswa_jawaban_provider.dart';
import 'package:apps/service/server.dart';
import 'package:dio/dio.dart';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:progress_dialog/progress_dialog.dart';
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

// String url = jawabanUrl + _file;
  ProgressDialog pr;
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
    String url = soalUrl + _file;
    SiswaJawabanProvider siswaJawabanProvider =
        Provider.of<SiswaJawabanProvider>(context);
    SiswaJawabanModel jawaban_siswa = siswaJawabanProvider.jawaban_siswa;

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
    handleAdd() async {
      pr.show();
      if (!(filetugas != null)) {
        Flushbar(
          duration: Duration(seconds: 4),
          flushbarPosition: FlushbarPosition.TOP,
          backgroundColor: Color(0xffff5c83),
          message: 'Pilih file',
        ).show(context);
      } else {
        var nis = siswa.nis;
        var url = '$baseUrl' + 'soal/$_id_soal/jawaban/$nis';
        print(url);
        var uri = Uri.parse(url);
        var request = new http.MultipartRequest("POST", uri);
        var multipartFile =
            await http.MultipartFile.fromPath('file_tugas', filetugas.path);
        request.files.add(multipartFile);
        var response = await request.send();
        print(response.request);
        if (response.statusCode == 200) {
          print("berhasil");
          pr.hide();
          Navigator.of(context).pop();
        } else {
          pr.hide();
          Flushbar(
            duration: Duration(seconds: 4),
            flushbarPosition: FlushbarPosition.TOP,
            backgroundColor: Color(0xffff5c83),
            message: 'Gagal Upload tugas, Silahkan cobalagi nantik',
          ).show(context);
        }
      }
    }

    Widget header() {
      return AppBar(
        backgroundColor: birumudaColor,
        elevation: 0,
        centerTitle: true,
        // automaticallyImplyLeading: false,
        title: Text('Detail Soal'),
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
              "Detail /",
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
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 17),
                  blurRadius: 23,
                  spreadRadius: -13,
                  color: blackColor)
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Detail",
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
              'Jenis',
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
              'File',
              style: primaryTextStyle.copyWith(fontWeight: medium),
              maxLines: 3,
            ),
            SizedBox(
              height: 5,
            ),
            GestureDetector(
              onTap: () async {
                pr.show();
                Map<Permission, PermissionStatus> statuses = await [
                  Permission.storage,
                  //add more permission to request here.
                ].request();
                if (statuses[Permission.storage].isGranted) {
                  var dir = await DownloadsPathProvider.downloadsDirectory;
                  if (dir != null) {
                    String savename = _file;
                    String savePath = dir.path + "/$savename";
                    print(savePath);
                    //output:  /storage/emulated/0/Download/banner.png

                    try {
                      await Dio().download(url, savePath,
                          onReceiveProgress: (received, total) {
                        if (total != -1) {
                          print((received / total * 100).toStringAsFixed(0) +
                              "%");
                          //you can build progressbar feature too
                        }
                      });
                      print("File is saved to download folder.");
                      pr.hide();
                      print('berhasil');
                    } on DioError catch (e) {
                      pr.hide();
                      print(e.message);
                    }
                  }
                } else {
                  pr.hide();
                  print("No permission to read and write.");
                }
                // var url = '$baseUrl' + 'jawaban/$id/download';
                // var response = await http.put(Uri.parse(url));
                // if (response.statusCode == 200) {
                //   print('berhasil');
                // } else {
                //   print("gagal");
                // }
              },
              child: Text(
                _file,
                style: subtitleTextStyle.copyWith(
                  fontSize: 12,
                  // fontWeight: medium
                ),
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
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 17),
                  blurRadius: 23,
                  spreadRadius: -13,
                  color: blackColor)
            ]),
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

    Widget upJawaban() {
      return Container(
        margin: EdgeInsets.only(top: defaultMargin),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: backgroundColor6,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 17),
                  blurRadius: 23,
                  spreadRadius: -13,
                  color: blackColor)
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Upload Jawaban",
              style: blackTextStyle.copyWith(fontWeight: semiBold),
            ),
            Divider(
              thickness: 1,
              color: Color(0Xff2e3141),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 100,
              width: double.infinity,
              // margin: EdgeInsets.only(top: 30),
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
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: 50,
              width: double.infinity,
              margin: EdgeInsets.only(top: 30),
              child: TextButton(
                onPressed: handleAdd,
                style: TextButton.styleFrom(
                  backgroundColor: birumudaColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'upload Jawaban',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
              ),
            )
          ],
        ),
      );
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
              handleAdd();
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

    Widget upload() {
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
      backgroundColor: backgroundColor6,
      resizeToAvoidBottomInset: false,
      appBar: header(),
      drawer: NavbarSiswa(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // detailTugasTitle(),
                tugas(),
                jawaban_siswa != null ? tugasJawaban() : upJawaban()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
