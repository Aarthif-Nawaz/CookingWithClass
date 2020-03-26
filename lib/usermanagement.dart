import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'dashboard.dart';

class UserManagement{
  StoreNewUser(user, context, email){
     Firestore.instance.collection('/users').add({
      'email': user['email'],
      'uid': user['localId'],
    }).then((value){
      Navigator.pushReplacement(
        context,
        FadeRoute(page: Dashboard(email: email,)),);
    }).catchError((e){
      print(e);
    });
  }
}
class FadeRoute extends PageRouteBuilder {
  final Widget page;
  FadeRoute({this.page})
      : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    page,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) =>
        FadeTransition(
          opacity: animation,
          child: child,
        ),
    transitionDuration: Duration(milliseconds: 500),
  );
}
