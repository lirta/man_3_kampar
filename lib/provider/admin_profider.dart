import 'package:apps/model/admin/admin_guru_model.dart';
import 'package:apps/model/admin/admin_siswa_model.dart';
import 'package:apps/service/admin_service.dart';
import 'package:flutter/material.dart';

class AdminProvider with ChangeNotifier {
  List<AdminGuruModel> _guru = [];
  List<AdminGuruModel> get guru => _guru;
  set guru(List<AdminGuruModel> guru) {
    _guru = guru;
    notifyListeners();
  }

  Future<bool> get_guru() async {
    try {
      List<AdminGuruModel> guru = await AdminService()
          .get_guru();
      _guru = guru;
      return true;
    } catch (e) {}
  }


  List<AdminSiswaModel> _siswa = [];
  List<AdminSiswaModel> get siswa => _siswa;
  set siswa(List<AdminSiswaModel> siswa) {
    _siswa = siswa;
    notifyListeners();
  }

  Future<bool> get_siswa() async {
    try {
      List<AdminSiswaModel> siswa = await AdminService()
          .get_siswa();
      _siswa = siswa;
      return true;
    } catch (e) {}
  }
  Future<bool> cangepass({String nip, String pass}) async {
    try {
      await AdminService()
          .cangepass(nip:nip, pass:pass);
      // _siswa = siswa;
      return true;
    } catch (e) {}
  }
}