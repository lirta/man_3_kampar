import 'package:apps/model/siswa/nilai_siswa_model.dart';
import 'package:apps/service/nilai_service.dart';
import 'package:flutter/cupertino.dart';

class NilaiProvider with ChangeNotifier{
  List<NilaiSiswaModel> _nilai = [];
  List<NilaiSiswaModel> get nilai => _nilai;
  set nilai(List<NilaiSiswaModel> nilai) {
    _nilai = nilai;
    notifyListeners();
  }
  Future<bool> getnilaisiswa({String id, String id_ajaran}) async {
    try {
      List<NilaiSiswaModel> nilai =
          await NilaiService().get_nilai_siswa(id: id, id_ajaran: id_ajaran);
      _nilai = nilai;
      return true;
    } catch (e) {}
  }
}