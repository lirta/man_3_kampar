import 'package:apps/model/guru/jadwal_model.dart';
import 'package:apps/service/jadwal_service.dart';
import 'package:flutter/foundation.dart';

class JadwalProvider with ChangeNotifier {
  List<JadwalModel> _jadwal = [];
  List<JadwalModel> get jadwal => _jadwal;

  set jadwal(List<JadwalModel> jadwal) {
    _jadwal = jadwal;
    notifyListeners();
  }

  Future<bool> getjadwal({String hari, String id}) async {
    try {
      List<JadwalModel> jadwal =
          await JadwalService().getjadwal(hari: hari, id: id);
      _jadwal = jadwal;
      return true;
    } catch (e) {}
  }

  Future<bool> getmapel({String id, String id_thn}) async {
    try {
      List<JadwalModel> jadwal = await JadwalService().getmapel(id: id, id_thn:id_thn);
      _jadwal = jadwal;
      return true;
    } catch (e) {}
  }
}
