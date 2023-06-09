import 'package:e_commerce/model/tcmbBilgiAmacliKurlar.dart';
import 'package:e_commerce/services/api_service.dart';
import 'package:flutter/material.dart';

class TCMBBilgiAmacliKurlarProvider with ChangeNotifier {
  List<TCMBBilgiAmacliKurlar> _tcmbBilgiAmacliKurlar = [];
  Services service = Services();

  List<TCMBBilgiAmacliKurlar>? get tcbmBilgiAmacliKurlar =>
      _tcmbBilgiAmacliKurlar;

  fetchData() async {
    _tcmbBilgiAmacliKurlar.clear();
    _tcmbBilgiAmacliKurlar = await service.fetchData();
    notifyListeners();
  }
}
