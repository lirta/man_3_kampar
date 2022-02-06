import 'package:apps/model/guru/daftar_siswa_perkelas.dart';
import 'package:apps/service/server.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

import '../theme.dart';

class DaftarAbsenSiswa extends StatelessWidget {
  // const DaftarAbsenSiswa({Key key}) : super(key: key);
  DaftarSiswaPerkelasModel siswa;
  String id_mapel;
  String id_kelas;
  DaftarAbsenSiswa(this.siswa, this.id_mapel, this.id_kelas);

  @override
  Widget build(BuildContext context) {
    String siswa_id = siswa.id_siswa;
    Widget absen() {
      return Row(
        children: [
          Container(
            // padding: EdgeInsets.only(left: 10),
            height: 40,
            width: 50,
            child: TextButton(
              onPressed: () async {
                print(id_kelas);
                print(id_mapel);
                print(siswa_id);
                print(id_kelas);
                var url = '$baseUrl' + 'absen/$id_mapel';
                var response = await http.post(Uri.parse(url), body: {
                  'id_kelas': id_kelas,
                  'id_matapelajaran': id_mapel,
                  'id_siswa': siswa_id,
                  'keterangan': "Hadir"
                });
                if (response.statusCode == 200) {
                  print('update berhasil');
                  Navigator.of(context).pop();
                }
              },
              style: TextButton.styleFrom(
                  backgroundColor: hadir,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
              child: Text(
                'H',
                style: blackTextStyle.copyWith(fontWeight: semiBold),
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            // padding: EdgeInsets.only(left: 10),
            height: 40,
            width: 50,
            child: TextButton(
              onPressed: () async {
                print(id_kelas);
                print(id_mapel);
                print(siswa_id);
                print(id_kelas);
                var url = '$baseUrl' + 'absen/$id_mapel';
                var response = await http.post(Uri.parse(url), body: {
                  'id_kelas': id_kelas,
                  'id_matapelajaran': id_mapel,
                  'id_siswa': siswa_id,
                  'keterangan': "Izin"
                });
                if (response.statusCode == 200) {
                  print('update berhasil');
                  Navigator.of(context).pop();
                }
              },
              style: TextButton.styleFrom(
                  backgroundColor: izin,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
              child: Text(
                'I',
                style: blackTextStyle.copyWith(fontWeight: semiBold),
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            // padding: EdgeInsets.only(left: 10),
            height: 40,
            width: 50,
            child: TextButton(
              onPressed: () async {
                print(id_kelas);
                print(id_mapel);
                print(siswa_id);
                print(id_kelas);
                var url = '$baseUrl' + 'absen/$id_mapel';
                var response = await http.post(Uri.parse(url), body: {
                  'id_kelas': id_kelas,
                  'id_matapelajaran': id_mapel,
                  'id_siswa': siswa_id,
                  'keterangan': "Sakit"
                });
                if (response.statusCode == 200) {
                  print('update berhasil');
                  Navigator.of(context).pop();
                }
              },
              style: TextButton.styleFrom(
                  backgroundColor: sakit,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
              child: Text(
                'S',
                style: blackTextStyle.copyWith(fontWeight: semiBold),
              ),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Container(
            // padding: EdgeInsets.only(left: 10),
            height: 40,
            width: 50,
            child: TextButton(
              onPressed: () async {
                print(id_kelas);
                print(id_mapel);
                print(siswa_id);
                print(id_kelas);
                var url = '$baseUrl' + 'absen/$id_mapel';
                var response = await http.post(Uri.parse(url), body: {
                  'id_kelas': id_kelas,
                  'id_matapelajaran': id_mapel,
                  'id_siswa': siswa_id,
                  'keterangan': "Alfa"
                });
                if (response.statusCode == 200) {
                  print('update berhasil');
                  Navigator.of(context).pop();
                }
              },
              style: TextButton.styleFrom(
                  backgroundColor: alpa,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12))),
              child: Text(
                'A',
                style: blackTextStyle.copyWith(fontWeight: semiBold),
              ),
            ),
          )
        ],
      );
    }

    Widget _buildPopupDialog(BuildContext context) {
      return new AlertDialog(
        title: Text(siswa.nama),
        content: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[absen()],
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

    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) => _buildPopupDialog(context),
        );
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
                  Text(
                    siswa.nama,
                    // 'lirta',
                    style: blackTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: semiBold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    siswa.nis,
                    // 'lirta',
                    style: blackTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
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
