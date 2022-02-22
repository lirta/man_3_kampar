import 'dart:convert';

import 'package:apps/model/guru/ajaran_model.dart';
import 'package:apps/service/server.dart';
import 'package:http/http.dart' as http;

class AjaranService {
  Future<List<AjaranModel>> getajaran() async {
    // print('ini id kelas' + id);
    var url = '$baseUrl' + 'getajaran';
    var response = await http.get(Uri.parse(url));
    print(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['ajaran'];
      List<AjaranModel> ajaran = [];
      for (var item in data) {
        ajaran.add(AjaranModel.fromJson(item));
      }
      return ajaran;
    }
  }
}
