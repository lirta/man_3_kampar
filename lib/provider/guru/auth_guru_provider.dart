import 'package:apps/model/guru/guru_model.dart';
import 'package:apps/service/auth_services.dart';
import 'package:flutter/material.dart';

class AuthGuruProvider with ChangeNotifier {
  GuruModel _guru;
  GuruModel get guru => _guru;

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
}
