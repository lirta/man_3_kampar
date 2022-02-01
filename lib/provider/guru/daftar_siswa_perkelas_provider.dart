import 'package:apps/model/guru/daftar_siswa_perkelas.dart';
import 'package:apps/service/jadwal_siswa_perkelas_service.dart';
import 'package:flutter/cupertino.dart';

class DaftarSiswaPerkelasProvider with ChangeNotifier {
  List<DaftarSiswaPerkelasModel> _siswa = [];
  List<DaftarSiswaPerkelasModel> get siswa => _siswa;
  set siswa(List<DaftarSiswaPerkelasModel> siswa) {
    _siswa = siswa;
    notifyListeners();
  }

  Future<bool> getsiswaPerkelas({String id}) async {
    try {
      List<DaftarSiswaPerkelasModel> siswa =
          await DaftarSiswaPerkelasService().getsiswaPerkelas(id: id);
      _siswa = siswa;
      return true;
    } catch (e) {}
  }
}
