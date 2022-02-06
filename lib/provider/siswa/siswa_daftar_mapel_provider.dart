import 'package:apps/model/siswa/siswa_daftar_mapel_model.dart';
import 'package:apps/service/siswa_daftar_mapel_service.dart';
import 'package:flutter/material.dart';

class SiswaDaftarMapelProvider with ChangeNotifier {
  List<SiswaDaftarMapelModel> _mapel = [];
  List<SiswaDaftarMapelModel> get mapel => _mapel;

  set mapel(List<SiswaDaftarMapelModel> mapel) {
    _mapel = mapel;
    notifyListeners();
  }

  Future<bool> getjadwal({String hari, String id}) async {
    try {
      List<SiswaDaftarMapelModel> mapel =
          await SiswaDaftarMapelService().getjadwal(hari: hari, id: id);
      _mapel = mapel;
      return true;
    } catch (e) {}
  }
}
