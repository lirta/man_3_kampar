import 'package:apps/model/siswa/daftar_nilai_model.dart';
import 'package:apps/service/daftar_nilai_service.dart';
import 'package:flutter/cupertino.dart';

class DaftarNilaiProvider with ChangeNotifier {
  List<DaftarNilaiModel> _nilai = [];
  List<DaftarNilaiModel> get nilai => _nilai;
  set nilai(List<DaftarNilaiModel> nilai) {
    _nilai = nilai;
    notifyListeners();
  }

  Future<bool> getnilai(
      {String id_kelas, String id_mapel, String id_siswa}) async {
    try {
      List<DaftarNilaiModel> nilai = await DaftarNilaiService()
          .getnilai(id_kelas: id_kelas, id_mapel: id_mapel, id_siswa: id_siswa);
      _nilai = nilai;
      return true;
    } catch (e) {}
  }
}
