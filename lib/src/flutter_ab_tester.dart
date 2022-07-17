import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FlutterABTester extends StatefulWidget {
  const FlutterABTester({
    Key? key,
    required this.testName,
    required this.email,
    required this.password,
    required this.mapOfTestCases
  }) : super(key: key);

  final String testName;
  final String email;
  final String password;
  final Map<String, Widget> mapOfTestCases;

  @override
  State<FlutterABTester> createState() => _FlutterABTesterState();
}

class _FlutterABTesterState extends State<FlutterABTester> {

  List listOfKeys = [];
  int randInt = 0;

  @override
  void initState() {
    // finding size of the map
    listOfKeys = widget.mapOfTestCases.keys.toList();

    // generating a random number (if listOfKeys.length is 3 then randInt can have values 0, 1 and 2)
    randInt = Random().nextInt(listOfKeys.length);

    // increasing number of users who were shown this widget by one in firebase
    updateTestsTable(widget.testName, widget.email, widget.password, listOfKeys, listOfKeys[randInt]);
  }

  Future<void> updateTestsTable(testName, email, password, listOfKeys, selectedVariant) async {
    var url = Uri.parse('https://vfltlrn78b.execute-api.us-east-2.amazonaws.com/prod/add-test');
    var body = {
      'test_name': testName,
      'email': email,
      'password': password,
      'listOfKeys': listOfKeys, // for the first time when the test will be created
      'selectedVariant': selectedVariant
    };
    var response = await http.post(url, body: jsonEncode(body));

    if(response.statusCode != 200) {
      updateTestsTable(testName, email, password, listOfKeys, selectedVariant);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.mapOfTestCases[listOfKeys[randInt]],
    );
  }
}
