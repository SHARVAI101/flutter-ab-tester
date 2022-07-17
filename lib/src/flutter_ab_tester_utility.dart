import 'dart:convert';

import 'package:http/http.dart' as http;

class FlutterABTesterUtility {

  Future<void> targetButtonPressed (String testName, String variantName, String buttonId, String email, String password) async {

    var url = Uri.parse('https://vfltlrn78b.execute-api.us-east-2.amazonaws.com/prod/update-target-clicks');
    var body = {
      'test_name': testName,
      'email': email,
      'password': password,
      'variantName': variantName,
      'buttonId': buttonId
    };
    var response = await http.post(url, body: jsonEncode(body));

    if(response.statusCode != 200) {
      targetButtonPressed(testName, variantName, buttonId, email, password);
    }
  }

}