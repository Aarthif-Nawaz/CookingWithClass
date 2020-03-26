import 'package:flutter/material.dart';
import 'welcome.dart';
import 'pdf.dart';
import 'pdfs.dart';
void main() {
   runApp(MyApp());
}

class MyApp extends StatelessWidget{
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Welcome(),
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
    );
  }

}