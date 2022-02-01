import 'package:apps/model/guru/daftar_tugas_model.dart';
import 'package:apps/service/daftar_tugas_service.dart';
import 'package:flutter/cupertino.dart';

class DaftarTugasProvider with ChangeNotifier {
  List<DaftarTugasModel> _d_tugas = [];
  List<DaftarTugasModel> get d_tugas => _d_tugas;
  set d_tugas(List<DaftarTugasModel> d_tugas) {
    _d_tugas = d_tugas;
    notifyListeners();
  }

  Future<bool> getdaftartugas({String id_kelas, String id_mapel}) async {
    try {
      List<DaftarTugasModel> d_tugas = await DaftarTugasService()
          .getdaftartugas(id_kelas: id_kelas, id_mapel: id_mapel);
      _d_tugas = d_tugas;
      return true;
    } catch (e) {}
  }
}
