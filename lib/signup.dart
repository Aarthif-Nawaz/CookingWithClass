import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'dashboard.dart';
import 'package:email_validator/email_validator.dart';
import 'package:validators/validators.dart';
import 'auth.dart';
import 'dart:async';
import 'httpException.dart';
import 'http.dart';
import 'usermanagement.dart';
class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Map<String, String> _authData = {
    "email" : "",
    "password" : "",
  };
  var _formkey = GlobalKey<FormState>();
  bool _obscure = true;
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();
  TextEditingController _conPass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _isloading ? CircularProgressIndicator() : Form(
          key: _formkey,
          child: Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                height: double.infinity,
                child: Image(image: AssetImage('Images/cover.jpg'),fit: BoxFit.cover,colorBlendMode: BlendMode.darken,color: Colors.black.withOpacity(0.85),),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.05,
                left: MediaQuery.of(context).size.height * 0.01,
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      FadeRoute(page: Login()),);
                  },
                ),),
              Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(top: 80),
                child: ListView(
                  children: <Widget>[
                    Column(
                      children: [Hero(
                        tag: 'move',
                        child: Container(
                          margin: EdgeInsets.only(left: 20,right: 15,),
                          alignment: Alignment.topCenter,
                          decoration: BoxDecoration(border: Border.all(color: Colors.orange,width: 3,style: BorderStyle.solid)),
                          child: Image(image: AssetImage('Images/Original Logo.jpg'),width: MediaQuery.of(context).size.width*0.9,height: MediaQuery.of(context).size.height*0.1,),
                        ),
                      ),
                    Container(
                      width: MediaQuery.of(context).size.width*0.9,
                      height: 50,
                      margin: EdgeInsets.all(10),
                      child: ListTile(
                        enabled: true,
                        title: TextFormField(
                          autocorrect: true,
                          onSaved: (val){
                            _authData['email'] = val;
                          },
                          keyboardType: TextInputType.emailAddress,
                          keyboardAppearance: Brightness.dark,
                          controller: _email,
                          validator: (String value){
                            if(EmailValidator.validate(value)==false){
                              return 'Please Enter a Valid Email ID';
                            }
                            else{
                              return null;
                            }
                          },
                          style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.w400,color: Colors.white,shadows: [BoxShadow(color: Colors.black),BoxShadow(color: Colors.yellowAccent),],decorationStyle: TextDecorationStyle.solid),
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.email,color: Colors.orange,semanticLabel: "Email",),
                            isDense: true,
                            border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.orange,style: BorderStyle.solid,width: 3)),
                            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.orange,style: BorderStyle.solid,width: 3)),
                            hintStyle: TextStyle(color: Colors.white),
                            hintText: "Email",
                            hintMaxLines: 5,
                            labelStyle: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.w400,color: Colors.white),
                            fillColor: Colors.blue,
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.orange,style: BorderStyle.solid,width: 3)),
                            errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red,style: BorderStyle.solid,width: 3)),
                            errorStyle: TextStyle(color: Colors.red,fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width*0.9,
                      height: 50,
                      margin: EdgeInsets.all(10),
                      child : ListTile(
                        title : TextFormField(
                          onSaved: (val){
                            _authData['password'] = val;
                          },
                          obscureText: _obscure,
                          style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.w400,color: Colors.white,shadows: [BoxShadow(color: Colors.black),BoxShadow(color: Colors.yellowAccent),],decorationStyle: TextDecorationStyle.solid),
                          autocorrect: true,
                          controller: _pass,
                          validator: (String value){
                            if(value.isEmpty){
                              return 'Please Enter a Password';
                            }
                            else if(value.length<6){
                              return 'Please Enter a strong password';
                            }
                            else{
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                _obscure
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.orange,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscure = !_obscure;
                                });
                              },
                            ),
                            hintMaxLines: 5,
                            border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.orange,style: BorderStyle.solid,width: 3)),
                            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.orange,style: BorderStyle.solid,width: 3)),
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.orange,style: BorderStyle.solid,width: 3)),
                            hintStyle: TextStyle(color: Colors.white),
                            hintText: "Password",
                            errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red,style: BorderStyle.solid,width: 3)),
                          ),
                        ),
                      ),),
                    Container(
                      width: MediaQuery.of(context).size.width*0.9,
                      height: 50,
                      margin: EdgeInsets.all(10),
                      child : ListTile(
                        title : TextFormField(
                          obscureText: _obscure,
                          controller: _conPass,
                          style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.w400,color: Colors.white,shadows: [BoxShadow(color: Colors.black),BoxShadow(color: Colors.yellowAccent),],decorationStyle: TextDecorationStyle.solid),
                          autocorrect: true,
                          validator: (String value){
                            if(value.isEmpty){
                              return 'Please Enter a Password';
                            }
                            else if(value.isNotEmpty && _pass.text != _conPass.text){
                              return 'Please Enter the Right Passwords';
                            }
                            else{
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                _obscure
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.orange,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscure = !_obscure;
                                });
                              },
                            ),
                            hintMaxLines: 5,
                            border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.orange,style: BorderStyle.solid,width: 3)),
                            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.orange,style: BorderStyle.solid,width: 3)),
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.orange,style: BorderStyle.solid,width: 3)),
                            hintStyle: TextStyle(color: Colors.white),
                            hintText: "Confirm Password",
                            labelStyle: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.w400,color: Colors.white),
                            errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red,style: BorderStyle.solid,width: 3)),
                          ),
                        ),
                      ),),
                    Container(
                      margin: EdgeInsets.all(20),
                    ),
                    SizedBox(
                      width: 200,
                      height: 50,
                      child: RaisedButton(shape: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),elevation: 4,color: Colors.orange,splashColor: Colors.deepOrange,textColor: Colors.black,padding: EdgeInsets.all(10),hoverColor: Colors.lightGreen,
                        child: Text('Sign Up',style: TextStyle(fontWeight: FontWeight.w800,fontSize: 20),),
                          onPressed: () {
                        submit();
                            }),),
                    Container(
                      margin: EdgeInsets.all(20),
                      child: SizedBox(
                        width: 300,
                        height: 50,
                        child: RaisedButton(onPressed: () => Navigator.pushReplacement(
                          context,
                          FadeRoute(page: Login()),),shape: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),elevation: 4,color: Colors.orange,splashColor: Colors.deepOrange,textColor: Colors.black,padding: EdgeInsets.all(10),hoverColor: Colors.lightGreen,
                          child: Text('Login',style: TextStyle(fontWeight: FontWeight.w800,fontSize: 20),),),
                      ),
                    ),
                  ],
                ),
              ],),),
          ],),
        ),
      ),
    );
  }
  var _isloading = false;
  Future<void> submit() async{
    if(!_formkey.currentState.validate()){
      return;
    }
    _formkey.currentState.save();
    setState(() {
      _isloading = true;
    });
    try {
      await Auth().signup(_authData['email'], _authData['password'],context);
    } on HttpException catch (e) {
      var errorMessage = 'Authentication Failed';
      if(e.toString().contains("EMAIL_EXISTS")){
        errorMessage = "Email Already Exists";
      }
      else if(e.toString().contains("OPERATION_NOT_ALLOWED")){
        errorMessage = "Password Sign In is disabled in this project";
      }
      else if(e.toString().contains("TOO_MANY_ATTEMPTS_TRY_LATER")){
        errorMessage = "Too many signup attempts please try again later";
      }
      else{
        errorMessage = "Sign Up Failed";
      }
      _ackAlert(context, "Error", errorMessage, "Okay");
      setState(() {
        _isloading = false;
      });
    }catch(Error){
      var message = 'Could Not SignUp, Please Check Your Network Connection';
      _ackAlert(context, "Error", message, "Okay");
    }


  }
  Future<void> _ackAlert(BuildContext context, String title, String Content, String textButton) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          titleTextStyle: TextStyle(color: Colors.orange,fontSize: 22),
          backgroundColor: Colors.black87,
          contentTextStyle: TextStyle(color: Colors.orange,fontSize: 18),
          title: Text(title),
          content:  Text(Content),
          actions: <Widget>[
            FlatButton(
              child: Text(textButton,style: TextStyle(color: Colors.orange,fontSize: 24),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
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

