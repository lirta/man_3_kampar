import 'package:apps/model/siswa/siswa_jawaban_model.dart';
import 'package:apps/service/siswa_jawaban_service.dart';
import 'package:flutter/material.dart';

class SiswaJawabanProvider with ChangeNotifier {
  SiswaJawabanModel _jawaban_siswa;
  SiswaJawabanModel get jawaban_siswa => _jawaban_siswa;

  set jawaban_siswa(SiswaJawabanModel jawaban_siswa) {
    _jawaban_siswa = jawaban_siswa;
    notifyListeners();
  }

  Future<bool> getjawaban({String id, String id_siswa}) async {
    try {
      SiswaJawabanModel jawaban_siswa =
          await SiswaJawabanService().getjawaban(id: id, id_siswa: id_siswa);
      _jawaban_siswa = jawaban_siswa;
      return true;
    } catch (e) {
      return false;
    }
  }
}
