import 'dart:convert';

import 'package:apps/model/guru/guru_model.dart';
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
}
