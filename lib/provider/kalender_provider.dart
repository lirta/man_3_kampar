import 'package:apps/model/siswa/kalender_model.dart';
import 'package:apps/service/kalender_service.dart';
import 'package:flutter/cupertino.dart';

class KalenderProvider with ChangeNotifier {
  List<KalenderModel> _kalender = [];
  List<KalenderModel> get kalender => _kalender;
  set kalender(List<KalenderModel> kalender) {
    _kalender = kalender;
    notifyListeners();
  }

  Future<bool> getkalender({String id}) async {
    try {
      List<KalenderModel> kalender =
          await KalenderService().getkalender(id: id);
      _kalender = kalender;
      return true;
    } catch (e) {}
  }
}
