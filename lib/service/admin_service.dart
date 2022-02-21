import 'dart:convert';

import 'package:apps/model/admin/admin_guru_model.dart';
import 'package:apps/model/admin/admin_siswa_model.dart';
import 'package:apps/service/server.dart';
import 'package:http/http.dart' as http;

class AdminService {
  Future<List<AdminGuruModel>> get_guru() async {
    var url = '$baseUrl' + 'admin_guru';
    var response = await http.get(Uri.parse(url));
    print(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['user'];
      List<AdminGuruModel> guru = [];
      for (var item in data) {
        guru.add(AdminGuruModel.fromJson(item));
      }
      return guru;
    }
  }
  Future<List<AdminSiswaModel>> get_siswa() async {
    var url = '$baseUrl' + 'admin_siswa';
    var response = await http.get(Uri.parse(url));
    print(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['user'];
      List<AdminSiswaModel> siswa = [];
      for (var item in data) {
        siswa.add(AdminSiswaModel.fromJson(item));
      }
      return siswa;
    }
  }
  Future<AdminSiswaModel> cangepass({String nip, String pass}) async {
    var url = '$baseUrl' + 'cangepass';
    var response = await http.post(Uri.parse(url),body:{'nip':nip, 'pass':pass});
    
    print(response.body);
    if (response.statusCode == 200) {
      
    }
  }
}