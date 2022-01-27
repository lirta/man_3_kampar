import 'dart:convert';

import 'package:apps/model/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:apps/provider/auth_provider.dart';

class AuthServices {
  String baseUrl = 'http://10.0.2.2/api/';

  Future<UserModel> register({ String nama,
       String hp,
       String alamat,
       String email,
       String password}) async {
    var url = '$baseUrl' + 'getUser.php';
    var response = await http.post(
      Uri.parse(url),
      body: {'nama':nama, 'hp':hp, 'alamat':alamat, 'email':email, 'password':password},
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['user'];
      UserModel user = UserModel.fromJson(data);
      return user;
    }
  }
  Future<UserModel> login({ 
       String email,
       String password}) async {
    var url = '$baseUrl' + 'login.php';
    var response = await http.post(
      Uri.parse(url),
      body: {'email':email, 'password':password},
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['user'];
      UserModel user = UserModel.fromJson(data);
      return user;
    }
  }


  
}
