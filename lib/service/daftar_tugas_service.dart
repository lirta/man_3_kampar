import 'dart:convert';

import 'package:apps/model/guru/daftar_tugas_model.dart';
import 'package:apps/service/server.dart';
import 'package:http/http.dart' as http;

class DaftarTugasService {
  Future<List<DaftarTugasModel>> getdaftartugas(
      {String id_kelas, String id_mapel}) async {
    // print('ini id kelas' + id);
    var url = '$baseUrl' + 'daftar_tugas/$id_kelas/$id_mapel';
    var response = await http.get(Uri.parse(url));
    print(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['soal'];
      List<DaftarTugasModel> d_tugas = [];
      for (var item in data) {
        d_tugas.add(DaftarTugasModel.fromJson(item));
      }
      return d_tugas;
    }
  }
}
