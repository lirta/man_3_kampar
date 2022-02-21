import 'package:apps/model/guru/daftar_nilai_guru_model.dart';
import 'package:apps/service/daftar_nilai_guru_service.dart';
import 'package:flutter/material.dart';

class DaftarNilaiGuruProvider with ChangeNotifier {
  List<DaftarNilaiGuruModel> _nilai = [];
  List<DaftarNilaiGuruModel> get nilai => _nilai;
  set nilai(List<DaftarNilaiGuruModel> nilai) {
    _nilai = nilai;
    notifyListeners();
  }

  Future<bool> getnilaiguru(
      {String id_kelas, String id_mapel}) async {
    try {
      List<DaftarNilaiGuruModel> nilai = await DaftarNilaiGuruService()
          .getnilaiguru(id_kelas: id_kelas, id_mapel: id_mapel);
      _nilai = nilai;
      return true;
    } catch (e) {}
  }
}