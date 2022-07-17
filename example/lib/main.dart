import 'package:example/VariantA.dart';
import 'package:example/VariantB.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ab_tester/flutter_ab_tester.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Map<String, Widget> x = {"Control": ControlGroup(text: "I'm Control"), "A": A(text: "I'm A")};
  Map<String, Widget> _mapOfTestCases = {"VariantA": VariantA(text: "I'm Variant A"), "VariantB": VariantB(text: "I'm Variant B")};

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FlutterABTester(testName: "first_test", email: "john@gmail.com", password: "johnpassword", mapOfTestCases: _mapOfTestCases,)),
          );
        },
        child: Text(
            'Click me to see variant'
        ),
      ),
    );
  }
}
