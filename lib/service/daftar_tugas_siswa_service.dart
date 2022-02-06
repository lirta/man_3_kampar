import 'dart:convert';

import 'package:apps/model/siswa/daftar_tugas_siswa_model.dart';
import 'package:apps/service/server.dart';
import 'package:http/http.dart' as http;

class DaftarTugasSiswaService {
  Future<List<DaftarTugasSiswaModel>> getdaftartugas(
      {String id_kelas, String id_mapel}) async {
    // print('ini id kelas' + id);
    var url = '$baseUrl' + 'soal_tampil/$id_kelas/$id_mapel';
    var response = await http.get(Uri.parse(url));
    print(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['soal'];
      List<DaftarTugasSiswaModel> tugas_siswa = [];
      for (var item in data) {
        tugas_siswa.add(DaftarTugasSiswaModel.fromJson(item));
      }
      return tugas_siswa;
    }
  }
}
