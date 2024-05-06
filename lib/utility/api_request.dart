import 'dart:convert';
import 'package:ca_junction/utility/constants.dart';
import 'package:ca_junction/utility/shared_pref.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

Future<dynamic> postRequest(String endPoint, Map<String, dynamic> data) async {
  String apiUrl = '$BASE_URL$endPoint/';
  String requestBody = jsonEncode(data);
  try {
    final http.Response response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: requestBody,
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = json.decode(response.body);
      final userData = json.decode(jsonData['data']);
      SharedPref.storeString(token, jsonData['token']);
      final box = await Hive.openBox(userBox);
      await box.put(userDataKey, userData);
      return json.decode(response.body);
    } else {
      return json.decode(response.body);
    }
  } catch (e) {}
}
