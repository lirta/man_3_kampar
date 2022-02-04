import 'dart:convert';

import 'package:apps/model/guru/daftar_jawaban.dart';
import 'package:apps/service/server.dart';
import 'package:http/http.dart' as http;

class DaftarJawabanService {
  Future<List<DaftarJawabanModel>> getjawaban({String id}) async {
    var url = '$baseUrl' + 'tampil_jawaban/$id';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['jawaban'];
      List<DaftarJawabanModel> jawaban = [];
      for (var item in data) {
        jawaban.add(DaftarJawabanModel.fromJson(item));
      }
      return jawaban;
    }
  }
}
