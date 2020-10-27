import 'package:flutter/material.dart';

class MyMedicinePage extends StatefulWidget {
  @override
  _MyMedicinePageState createState() => _MyMedicinePageState();
}

class _MyMedicinePageState extends State<MyMedicinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('이약모약'),
          elevation: 0.0,
        )
    );
  }
}