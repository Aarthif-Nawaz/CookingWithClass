import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Center(
        child: Text('Loading..',style: TextStyle(color: Colors.orange,fontSize: 30),),
      ),
    );
  }
}
