import 'package:apps/model/siswa/siswa_model.dart';
import 'package:apps/service/auth_services.dart';
import 'package:flutter/cupertino.dart';

class AuthSiswaProvider with ChangeNotifier {
  SiswaModel _siswa;
  SiswaModel get siswa => _siswa;
  set siswa(SiswaModel siswa) {
    _siswa = siswa;
    notifyListeners();
  }

  Future<bool> login({String username, String password}) async {
    try {
      SiswaModel siswa = await AuthServices()
          .loginSiswa(username: username, password: password);
      _siswa = siswa;
      return true;
    } catch (e) {
      return false;
    }
  }
}
