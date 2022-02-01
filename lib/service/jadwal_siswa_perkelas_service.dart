import 'dart:convert';

import 'package:apps/model/guru/daftar_siswa_perkelas.dart';
import 'package:apps/service/server.dart';
import 'package:http/http.dart' as http;

class DaftarSiswaPerkelasService {
  Future<List<DaftarSiswaPerkelasModel>> getsiswaPerkelas({String id}) async {
    print('ini id kelas' + id);
    var url = '$baseUrl' + 'siswa_perkelas/$id';
    var response = await http.get(Uri.parse(url));
    print(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['kelas_siswa'];
      List<DaftarSiswaPerkelasModel> siswa = [];
      for (var item in data) {
        siswa.add(DaftarSiswaPerkelasModel.fromJson(item));
      }
      return siswa;
    }
  }
}
