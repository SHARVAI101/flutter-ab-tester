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
  // map of the variants that need to be shown
  Map<String, Widget> _mapOfTestCases = {"VariantA": VariantA(text: "I'm Variant A"), "VariantB": VariantB(text: "I'm Variant B")};

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: (){
          // here, instead of calling your widget, we call FlutterABTester() which takes care of everything for you
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

// Variant A widget
class VariantA extends StatefulWidget {
  const VariantA({
    Key? key,
    this.text = "defaultA"
  }) : super(key: key);

  final String text;

  @override
  State<VariantA> createState() => _VariantAState();
}

class _VariantAState extends State<VariantA> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(widget.text, style: TextStyle(color: Colors.white),),
          ElevatedButton(
            onPressed: (){
              FlutterABTesterUtility().targetButtonPressed("first_test", "VariantA", "signup", "john@gmail.com", "johnpassword");

              // rest of your code
            },
            child: Text("Click for A"),
          )
        ],
      ),
    );
  }
}

// Widget for Variant B
class VariantB extends StatefulWidget {
  const VariantB({
    Key? key,
    this.text = "defaultB"
  }) : super(key: key);

  final String text;

  @override
  State<VariantB> createState() => _VariantBState();
}

class _VariantBState extends State<VariantB> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(widget.text, style: TextStyle(color: Colors.white),),
          ElevatedButton(
            onPressed: (){
              FlutterABTesterUtility().targetButtonPressed("first_test", "VariantB", "signup", "john@gmail.com", "johnpassword");

              // rest of your code
            },
            child: Text("Click for B"),
          )
        ],
      ),
    );
  }
}
