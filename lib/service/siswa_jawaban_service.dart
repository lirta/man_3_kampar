import 'dart:convert';

import 'package:apps/model/siswa/siswa_jawaban_model.dart';
import 'package:apps/service/server.dart';
import 'package:http/http.dart' as http;

class SiswaJawabanService {
  Future<SiswaJawabanModel> getjawaban({String id, String id_siswa}) async {
    print(id_siswa);
    var url = '$baseUrl' + 'tampil_jawaban_siswa/$id/$id_siswa';
    var response = await http.get(Uri.parse(url));
    // print(response.body);
    if (response.statusCode == 200) {
      // print(jsonDecode(response.body)['jawaban']);
      print(1);
      var data = jsonDecode(response.body)['jawaban'];
      print(2);
      // print("ini data" + data);
      SiswaJawabanModel jawaban_siswa = SiswaJawabanModel.fromJson(data);
      print(3);
      // print('ini jawaban siswa' + jawaban_siswa.toString());
      // print(jawaban_siswa.jawaban);

      return jawaban_siswa;
    } else {
      // print('gagal');
    }
  }
}
