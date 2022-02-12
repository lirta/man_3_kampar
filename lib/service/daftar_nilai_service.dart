import 'dart:convert';

import 'package:apps/model/siswa/daftar_nilai_model.dart';
import 'package:apps/service/server.dart';
import 'package:http/http.dart' as http;

class DaftarNilaiService {
  Future<List<DaftarNilaiModel>> getnilai(
      {String id_kelas, String id_mapel, String id_siswa}) async {
    var url = '$baseUrl' + 'nilai_siswa/$id_kelas/$id_mapel/$id_siswa';
    var response = await http.get(Uri.parse(url));
    print(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['nilai'];
      List<DaftarNilaiModel> nilai = [];
      for (var item in data) {
        nilai.add(DaftarNilaiModel.fromJson(item));
      }
      return nilai;
    }
  }
}
