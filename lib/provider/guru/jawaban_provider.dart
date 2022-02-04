import 'package:apps/model/guru/daftar_jawaban.dart';
import 'package:apps/service/daftar_jawaban_service.dart';
import 'package:flutter/cupertino.dart';

class DaftarJawabanProvider with ChangeNotifier {
  List<DaftarJawabanModel> _jawaban = [];
  List<DaftarJawabanModel> get jawaban => _jawaban;
  set jawaban(List<DaftarJawabanModel> jawaban) {
    _jawaban = jawaban;
    notifyListeners();
  }

  Future<bool> getjawaban({String id}) async {
    try {
      List<DaftarJawabanModel> jawaban =
          await DaftarJawabanService().getjawaban(id: id);
      _jawaban = jawaban;
      return true;
    } catch (e) {}
  }
}
