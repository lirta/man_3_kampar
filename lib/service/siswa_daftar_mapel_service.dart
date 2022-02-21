import 'dart:convert';

import 'package:apps/model/siswa/siswa_daftar_mapel_model.dart';
import 'package:apps/service/server.dart';
import 'package:http/http.dart' as http;

class SiswaDaftarMapelService {
  Future<List<SiswaDaftarMapelModel>> getjadwal(
      {String hari, String id}) async {
    var url = '$baseUrl' + 'jadwal/$hari/$id';
    var response = await http.get(Uri.parse(url));
    print(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['mapel'];
      List<SiswaDaftarMapelModel> mapel = [];
      for (var item in data) {
        mapel.add(SiswaDaftarMapelModel.fromJson(item));
      }

      return mapel;
    }
  }

  Future<List<SiswaDaftarMapelModel>> jadwal({String id}) async {
    var url = '$baseUrl' + 'get_jadwal/$id';
    var response = await http.get(Uri.parse(url));
    print(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['mapel'];
      List<SiswaDaftarMapelModel> mapel = [];
      for (var item in data) {
        mapel.add(SiswaDaftarMapelModel.fromJson(item));
      }

      return mapel;
    }
  }
}
