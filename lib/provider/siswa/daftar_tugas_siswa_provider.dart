import 'package:apps/model/siswa/daftar_tugas_siswa_model.dart';
import 'package:apps/service/daftar_tugas_siswa_service.dart';
import 'package:flutter/cupertino.dart';

class DaftarTugasSiswaProvider with ChangeNotifier {
  List<DaftarTugasSiswaModel> _tugas_siswa = [];
  List<DaftarTugasSiswaModel> get tugas_siswa => _tugas_siswa;
  set tugas_siswa(List<DaftarTugasSiswaModel> tugas_siswa) {
    _tugas_siswa = tugas_siswa;
    notifyListeners();
  }

  Future<bool> getdaftartugas({String id_kelas, String id_mapel}) async {
    try {
      List<DaftarTugasSiswaModel> tugas_siswa = await DaftarTugasSiswaService()
          .getdaftartugas(id_kelas: id_kelas, id_mapel: id_mapel);
      _tugas_siswa = tugas_siswa;
      return true;
    } catch (e) {}
  }
}
