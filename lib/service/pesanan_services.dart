import 'dart:convert';

import 'package:apps/model/pesanan_model.dart';
import 'package:http/http.dart' as http;

class PesananServices {
  String baseUrl = 'http://10.0.2.2/api/';
  Future<PesananModel> postPesanan(
      {String id_konsumen,
      String nama_penerima,
      String alamat_penerima,
      String hp_penerima,
      String kg,
      String total}) async {
    var url = '$baseUrl' + 'pesanan.php';
    var response = await http.post(Uri.parse(url), body: {
      'id_konsumen': id_konsumen,
      'nama_penerima': nama_penerima,
      'alamat_penerima': alamat_penerima,
      'hp_penerima': hp_penerima,
      'kg': kg,
      'total': total
    });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['pesanan'];
      PesananModel pesanan = PesananModel.fromJson(data);
      return pesanan;
    }
  }
  Future<PesananModel> getPesanan(
      {String id}) async {
    var url = '$baseUrl' + 'pesanan.php';
    var response = await http.post(Uri.parse(url), body: {'id': id});
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['pesanan'];
      PesananModel pesanan = PesananModel.fromJson(data);
      return pesanan;
    }
  }
}
