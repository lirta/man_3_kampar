import 'dart:convert';

import 'package:apps/model/siswa/kalender_model.dart';
import 'package:apps/service/server.dart';
import 'package:http/http.dart' as http;

class KalenderService {
  Future<List<KalenderModel>> getkalender({String id}) async {
    var url = '$baseUrl' + 'kalender/$id';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      print(response.body);
      var data = jsonDecode(response.body)['kalender'];
      List<KalenderModel> kalender = [];
      for (var item in data) {
        kalender.add(KalenderModel.fromJson(item));
      }
      return kalender;
    }
  }
}
