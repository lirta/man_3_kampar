import 'dart:convert';

import 'package:apps/model/siswa/daftar_absen_siswa_model.dart';
import 'package:apps/service/server.dart';
import 'package:http/http.dart' as http;

class DaftarAbsenSiswaService {
  Future<List<DaftarAbsenSiswaModel>> getabsen(
      {String id_siswa, String id_matapelajaran}) async {
    var url = '$baseUrl' + 'absen/$id_siswa/$id_matapelajaran';
    var response = await http.get(Uri.parse(url));
    print(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['absen'];
      List<DaftarAbsenSiswaModel> absen_siswa = [];
      for (var item in data) {
        absen_siswa.add(DaftarAbsenSiswaModel.fromJson(item));
      }
      return absen_siswa;
    }
  }
}
