import 'package:flutter/material.dart';
import 'package:flutter_ab_tester/flutter_ab_tester.dart';

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
