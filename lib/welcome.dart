import 'package:flutter/material.dart';
import 'animation.dart';
import 'intro.dart';
import 'login.dart';
import 'SimpleAutoCompleteTextField.dart';
import 'auth.dart';
import 'dashboard.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  void initState() {
    super.initState();
    new Future.delayed(
      const Duration(seconds: 10),
          () => Auth().isAuth ? Navigator.of(context).pushAndRemoveUntil(
              ScaleRoute(page: Dashboard()), (Route<dynamic> route) => false) : Navigator.of(context).pushAndRemoveUntil(
          ScaleRoute(page: Login()), (Route<dynamic> route) => false),
    );
  }
  @override
  Widget build(BuildContext context) {
    const int $trade = 0x2122;
    return Scaffold(
      backgroundColor: Colors.white10,
      resizeToAvoidBottomInset: false,
      body:Stack(
          children: <Widget>[
            Container(
                width: double.infinity,
                height: double.infinity,
                child: Image(image: AssetImage('Images/eclair.jpg'),fit: BoxFit.cover,colorBlendMode: BlendMode.darken,color: Colors.black.withOpacity(0.75),)),
            Hero(
              tag: 'move',
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.4,left: MediaQuery.of(context).size.width*0.04,right: MediaQuery.of(context).size.width*0.02),
                decoration: BoxDecoration(border: Border.all(color: Colors.orange,width: 3,style: BorderStyle.solid)),
                child: Image(image: AssetImage('Images/Original Logo.jpg'),height: MediaQuery.of(context).size.height*1,),width: MediaQuery.of(context).size.width*0.9,height: MediaQuery.of(context).size.height*0.1,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.5),
              child: Padding(
                padding: EdgeInsets.all(30),
                child: Animations('Learn Authentic Cook Authentic !'),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.1),
              child: Padding(
                padding: EdgeInsets.all(30),
                child: Animations('Cooking With Class'),
              ),
            ),
            Positioned(
              bottom: 15,
              right: 30,
              left: 40,
              child: new Text('2019 \u00a9 Powered By ATHIF-INNOVATIVES \u2122 ',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: Colors.orange),),)
          ],
        ),
      );
  }

}
class ScaleRoute extends PageRouteBuilder {
  final Widget page;
  ScaleRoute({this.page})
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
        ScaleTransition(
          scale: Tween<double>(
            begin: 0.0,
            end: 1.0,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.fastOutSlowIn,
            ),
          ),
          child: child,
        ),
    transitionDuration: Duration(milliseconds: 500),
  );
}





