import 'package:apps/model/guru/daftar_jawaban.dart';
import 'package:apps/service/server.dart';
import 'package:dio/dio.dart';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';

import '../theme.dart';

class TugasSiswa extends StatelessWidget {
  // const TugasSiswa({Key key}) : super(key: key);
  DaftarJawabanModel jawaban;
  TugasSiswa(this.jawaban);

  @override
  Widget build(BuildContext context) {
    String id = jawaban.id_jawaban;
    String url = jawabanUrl + jawaban.jawaban;
    return GestureDetector(
      onTap: () {
        // Navigator.pushNamed(context, '/detail-mapel');
      },
      child: Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.only(top: 10, left: 12, bottom: 14, right: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: backgroundColor6),
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
                      Text(
                        jawaban.nilai == null || jawaban.nilai == ""
                            ? 'Belum ada nilai'
                            : jawaban.nilai,
                        // 'lirta',
                        style: blackTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: semiBold,
                        ),
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
                          } on DioError catch (e) {
                            print(e.message);
                          }
                        }
                      } else {
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
