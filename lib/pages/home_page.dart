import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  final int number = 52;
  final String name = "Sowrav";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: Center(
        child: Container(
          child: Text("Welcome $name and roll no. $number"),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
