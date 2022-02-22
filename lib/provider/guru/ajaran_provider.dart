import 'package:apps/model/guru/ajaran_model.dart';
import 'package:apps/service/ajaran_service.dart';
import 'package:flutter/cupertino.dart';

class AjaranProvider with ChangeNotifier {
  List<AjaranModel> _ajaran = [];
  List<AjaranModel> get ajaran => _ajaran;
  set ajaran(List<AjaranModel> ajaran) {
    _ajaran = ajaran;
    notifyListeners();
  }

  Future<bool> getajaran({String id}) async {
    try {
      List<AjaranModel> ajaran = await AjaranService().getajaran();
      _ajaran = ajaran;
      return true;
    } catch (e) {}
  }
}
