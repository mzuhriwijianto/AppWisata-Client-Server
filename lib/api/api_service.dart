import 'dart:convert';

import 'package:flutterlayout/model/tourism_place.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const baseUrl = 'http://192.168.99.38/tourism-backend/public/api/';

  Future<TourismResult> getTourismList() async {
    final response = await http.get(Uri.parse(baseUrl + 'tourism'));
    if (response.statusCode == 200) {
      return TourismResult.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Tidak bisa terkoneksi ke server !');
    }
  }
}
