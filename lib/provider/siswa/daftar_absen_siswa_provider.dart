import 'package:apps/model/siswa/daftar_absen_siswa_model.dart';
import 'package:apps/service/daftar_absen_siswa_service.dart';
import 'package:flutter/material.dart';

class DaftarAbsenSiswaProvider with ChangeNotifier {
  List<DaftarAbsenSiswaModel> _absen_siswa = [];
  List<DaftarAbsenSiswaModel> get absen_siswa => _absen_siswa;
  set absen_siswa(List<DaftarAbsenSiswaModel> absen_siswa) {
    _absen_siswa = absen_siswa;
    notifyListeners();
  }

  Future<bool> getabsen({String id_siswa, String id_matapelajaran}) async {
    try {
      List<DaftarAbsenSiswaModel> absen_siswa = await DaftarAbsenSiswaService()
          .getabsen(id_siswa: id_siswa, id_matapelajaran: id_matapelajaran);
      _absen_siswa = absen_siswa;
      return true;
    } catch (e) {}
  }
}
