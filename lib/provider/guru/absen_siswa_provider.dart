import 'package:apps/model/guru/absen_seswa_model.dart';
import 'package:apps/service/absen_siswa_service.dart';
import 'package:flutter/cupertino.dart';

class AbsenSiswaProvider with ChangeNotifier {
  List<AbsenSiswaModel> _absen = [];
  List<AbsenSiswaModel> get absen => _absen;
  set absen(List<AbsenSiswaModel> absen) {
    _absen = absen;
    notifyListeners();
  }

  Future<bool> getabsen({String id_siswa, String id_matapelajaran}) async {
    try {
      List<AbsenSiswaModel> absen = await AbsenSiswaService()
          .getabsen(id_siswa: id_siswa, id_matapelajaran: id_matapelajaran);
      _absen = absen;
      return true;
    } catch (e) {}
  }
}
