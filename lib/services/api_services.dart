import 'dart:convert';

import 'package:brahma/config/api_json.dart';
import 'package:brahma/config/api_keys.dart';
import 'package:http/http.dart' as http;

class ApiService {
  bool isDummyData = true;
  Future<Map<String, dynamic>> fetchData(
      {required String querTerm, String start = "0"}) async {
    try {
      if (!isDummyData) {
        String q =
            querTerm.contains(' ') ? querTerm.split(' ').join('%20') : querTerm;
        final response = await http.get(
          Uri.parse(
              'https://www.googleapis.com/customsearch/v1?key=$apiKey&cx=$contextKey&q=$q&start=$start'),
        );
        if (response.statusCode == 200) {
          final jsonData = response.body;
          final resData = json.decode(jsonData);
          return resData;
        }
      }
    } catch (e) {
      print(e.toString());
    }
    return apiResponse;
  }
}
