import 'package:apps/model/guru/daftar_jawaban.dart';
import 'package:apps/provider/guru/jawaban_provider.dart';
import 'package:apps/service/server.dart';
import 'package:dio/dio.dart';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:intl/number_symbols_data.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';

import '../theme.dart';

class TugasSiswa extends StatelessWidget {
  // const TugasSiswa({Key key}) : super(key: key);
  DaftarJawabanModel jawaban;
  TugasSiswa(this.jawaban);
  TextEditingController nilaiController = TextEditingController(text: '');
  ProgressDialog pr;
  @override
  Widget build(BuildContext context) {
    DaftarJawabanProvider daftarJawabanProvider =
        Provider.of<DaftarJawabanProvider>(context);
    String id = jawaban.id_jawaban;
    String url = jawabanUrl + jawaban.jawaban;
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
    addnilai() async {
      pr.show();
      if (nilaiController.text != null) {
        var url = '$baseUrl' + 'soal_guru/nilai_jawaban/$id';
        var response = await http
            .post(Uri.parse(url), body: {'nilai': nilaiController.text});
        if (response.statusCode == 200) {
          pr.hide();
          print('update berhasil');
          Navigator.of(context).pop();
        }
      }
    }

    Widget nilaiInput() {
      return Container(
        margin: EdgeInsets.only(top: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.penFancy,
                      size: 15,
                      color: birutuaColor,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        style: blackTextStyle,
                        controller: nilaiController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Nilai',
                          hintStyle: subtitleTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget _buildPopupDialog(BuildContext context) {
      return new AlertDialog(
        title: const Text('Add Nilai'),
        content: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[nilaiInput()],
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              addnilai();
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

    return GestureDetector(
      onTap: () {
        // Navigator.pushNamed(context, '/detail-mapel');
      },
      child: Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.only(top: 10, left: 12, bottom: 14, right: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: izin,
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 17),
                  blurRadius: 23,
                  spreadRadius: -13,
                  color: blackColor)
            ]),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Nama : ',
                        // 'lirta',
                        style: blackTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: semiBold,
                        ),
                      ),
                      Text(
                        jawaban.siswa,
                        // 'lirta',
                        style: blackTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: semiBold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        'Nis  : ',
                        // 'lirta',
                        style: blackTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: semiBold,
                        ),
                      ),
                      Text(
                        jawaban.nis,
                        // 'lirta',
                        style: blackTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: semiBold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        'Nilai : ',
                        // 'lirta',
                        style: blackTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: semiBold,
                        ),
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            jawaban.nilai == null
                                ? 'Belum ada nilai'
                                : jawaban.nilai,
                            // 'lirta',
                            style: blackTextStyle.copyWith(
                              fontSize: 18,
                              fontWeight: semiBold,
                            ),
                          ),
                          SizedBox(
                            width: 100,
                          ),
                          Container(
                            // padding: EdgeInsets.only(left: 10),
                            height: 40,
                            width: 80,
                            child: TextButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      _buildPopupDialog(context),
                                );
                              },
                              style: TextButton.styleFrom(
                                  backgroundColor: biruColor,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12))),
                              child: Text(
                                'Add Nilai',
                                style: primaryTextStyle,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 1,
                    color: Color(0Xff2e3141),
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
                        var dir =
                            await DownloadsPathProvider.downloadsDirectory;
                        if (dir != null) {
                          String savename = jawaban.jawaban;
                          String savePath = dir.path + "/$savename";
                          print(savePath);
                          //output:  /storage/emulated/0/Download/banner.png

                          try {
                            await Dio().download(url, savePath,
                                onReceiveProgress: (received, total) {
                              if (total != -1) {
                                print((received / total * 100)
                                        .toStringAsFixed(0) +
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
                      jawaban.jawaban,
                      // 'lirta',
                      style: blackTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: semiBold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
