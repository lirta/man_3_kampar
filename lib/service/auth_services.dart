import 'dart:convert';

import 'package:apps/model/admin/admin_model.dart';
import 'package:apps/model/guru/guru_model.dart';
import 'package:apps/model/siswa/siswa_model.dart';
import 'package:apps/service/server.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthServices {
  Future<GuruModel> loginGuru({String username, String password}) async {
    var url = '$baseUrl' + 'login_pos';
    var response = await http.post(
      Uri.parse(url),
      body: {'username': username, 'password': password},
    );
    print(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['user'];
      GuruModel guru = GuruModel.fromJson(data);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool("is_login", true);
      prefs.setString("id", guru.id);
      prefs.setString("akses", guru.akses);
      return guru;
    }
  }
  Future<AdminModel> loginadmin({String username, String password}) async {
    var url = '$baseUrl' + 'login_pos';
    var response = await http.post(
      Uri.parse(url),
      body: {'username': username, 'password': password},
    );
    print(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['user'];
      AdminModel admin = AdminModel.fromJson(data);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool("is_login", true);
      prefs.setString("id", admin.id);
      prefs.setString("akses", admin.akses);
      return admin;
    }
  }

  Future<SiswaModel> loginSiswa({String username, String password}) async {
    var url = '$baseUrl' + 'login_pos';
    var response = await http.post(
      Uri.parse(url),
      body: {'username': username, 'password': password},
    );
    if (response.statusCode == 200) {
      print(response.body);
      var data = jsonDecode(response.body)['user'];
      SiswaModel siswa = SiswaModel.fromJson(data);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool("is_login", true);
      prefs.setString("id", siswa.id);
      prefs.setString("akses", siswa.akses);
      return siswa;
    }
  }
}
