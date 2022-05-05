import 'dart:convert';

import 'package:api_call/models/homepageresponse.dart';
import 'package:http/http.dart' as http;

class HomepageService {
  Future<HomeResponse?> getHomepage() async {
    http.Response response;

    response = await http
        .get(Uri.parse("http://192.168.29.169:80/matri/api/User/homepage"));

    if (response.statusCode == 200) {
      HomeResponse homeResponse =
          HomeResponse.fromJson(jsonDecode(response.body));
      return homeResponse;
    } else {
      return null;
    }
  }
}
