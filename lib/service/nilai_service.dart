import 'dart:convert';

import 'package:apps/model/siswa/nilai_siswa_model.dart';
import 'package:apps/service/server.dart';
import 'package:http/http.dart' as http;
class NilaiService {
  Future<List<NilaiSiswaModel>> get_nilai_siswa({String id, String id_ajaran}) async {
    var url = '$baseUrl' + 'nilai_siswa/$id/$id_ajaran';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      print(response.body);
      var data = jsonDecode(response.body)['nilai'];
      List<NilaiSiswaModel> nilai = [];
      for (var item in data) {
        nilai.add(NilaiSiswaModel.fromJson(item));
      }
      return nilai;
    }
  }

  

  
}