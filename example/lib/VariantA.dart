import 'package:flutter/material.dart';
import 'package:flutter_ab_tester/flutter_ab_tester.dart';

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
