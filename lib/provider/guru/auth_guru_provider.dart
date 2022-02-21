import 'package:apps/model/admin/admin_model.dart';
import 'package:apps/model/guru/guru_model.dart';
import 'package:apps/service/auth_services.dart';
import 'package:flutter/material.dart';

class AuthGuruProvider with ChangeNotifier {
  AdminModel _admin;
  GuruModel _guru;
  AdminModel get admin => _admin;
  GuruModel get guru => _guru;

  set admin(AdminModel admin) {
    _admin = admin;
    notifyListeners();
  }
  set guru(GuruModel guru) {
    _guru = guru;
    notifyListeners();
  }

  Future<bool> login({
    String username,
    String password,
  }) async {
    try {
      GuruModel guru = await AuthServices()
          .loginGuru(username: username, password: password);

      _guru = guru;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
  Future<bool> loginadmin({
    String username,
    String password,
  }) async {
    try {
      AdminModel admin = await AuthServices()
          .loginadmin(username: username, password: password);

      _admin = admin;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
