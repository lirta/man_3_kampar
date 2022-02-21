import 'dart:convert';

import 'package:apps/model/guru/daftar_nilai_guru_model.dart';
import 'package:apps/service/server.dart';
import 'package:http/http.dart' as http;

class DaftarNilaiGuruService {
  Future<List<DaftarNilaiGuruModel>> getnilaiguru(
      {String id_kelas, String id_mapel}) async {
    var url = '$baseUrl' + 'nilai_siswa_guru/$id_kelas/$id_mapel';
    var response = await http.get(Uri.parse(url));
    print(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['nilai'];
      List<DaftarNilaiGuruModel> nilai = [];
      for (var item in data) {
        nilai.add(DaftarNilaiGuruModel.fromJson(item));
      }
      return nilai;
    }
  }
}