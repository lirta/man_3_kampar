import 'dart:convert';

import 'package:apps/model/guru/absen_seswa_model.dart';
import 'package:apps/service/server.dart';
import 'package:http/http.dart' as http;

class AbsenSiswaService {
  Future<List<AbsenSiswaModel>> getabsen(
      {String id_siswa, String id_matapelajaran}) async {
    var url = '$baseUrl' + 'absensi/$id_siswa/$id_matapelajaran';
    var response = await http.get(Uri.parse(url));
    print(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['absen'];
      List<AbsenSiswaModel> absen = [];
      for (var item in data) {
        absen.add(AbsenSiswaModel.fromJson(item));
      }
      return absen;
    }
  }
}
