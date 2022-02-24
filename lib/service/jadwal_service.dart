import 'dart:convert';

import 'package:apps/model/admin/jadwal_admin_model.dart';
import 'package:apps/model/guru/jadwal_model.dart';
import 'package:apps/service/server.dart';
import 'package:http/http.dart' as http;

class JadwalService {
  Future<List<JadwalModel>> getjadwal({String hari, String id}) async {
    var url = '$baseUrl' + 'jadwal_guru/$hari/$id';
    var response = await http.get(Uri.parse(url));
    print(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['jadwal'];
      List<JadwalModel> jadwal = [];
      for (var item in data) {
        jadwal.add(JadwalModel.fromJson(item));
      }

      return jadwal;
    }
  }

  Future<List<JadwalModel>> getmapel({String id, String id_thn}) async {
    var url = '$baseUrl' + 'get_jadwal_guru/$id/$id_thn';
    var response = await http.get(Uri.parse(url));
    print(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['jadwal'];
      List<JadwalModel> jadwal = [];
      for (var item in data) {
        jadwal.add(JadwalModel.fromJson(item));
      }

      return jadwal;
    }
  }

  Future<List<JadwalModelAdmin>> getmapeladmin({String id_thn}) async {
    var url = '$baseUrl' + 'get_jadwal_admin/$id_thn';
    var response = await http.get(Uri.parse(url));
    print(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['jadwal'];
      List<JadwalModelAdmin> jadwaladmin = [];
      for (var item in data) {
        jadwaladmin.add(JadwalModelAdmin.fromJson(item));
      }

      return jadwaladmin;
    }
  }
}
