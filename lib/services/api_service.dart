import 'dart:convert';
import 'package:e_commerce/model/tcmbBilgiAmacliKurlar.dart';
import 'package:http/http.dart' as http;

class Services {
  Future<List<TCMBBilgiAmacliKurlar>> fetchData() async {
    List<TCMBBilgiAmacliKurlar> tcmbBilgiAmacliKurlar = [];
    tcmbBilgiAmacliKurlar.clear();
    final response = await http.get(
      Uri.parse('http://hasanadiguzel.com.tr/api/bilgiamackur'),
    );
    var jsonResponse = utf8.decode(response.body.runes.toList());
    Map<String, dynamic> jsonRespone2 =
        Map<String, dynamic>.from(jsonDecode(jsonResponse));
    for (Map<String, dynamic> jsondata
        in jsonRespone2["TCMB_BilgiAmacliKurlar"]) {
      tcmbBilgiAmacliKurlar.add(TCMBBilgiAmacliKurlar.fromJson(jsondata));
    }
    return tcmbBilgiAmacliKurlar;
  }
}
