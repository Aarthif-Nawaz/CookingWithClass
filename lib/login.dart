import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'signup.dart';
import 'package:validators/validators.dart';
import 'package:email_validator/email_validator.dart';
import 'auth.dart';
import 'dashboard.dart';
import 'httpException.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var _red = false;
  var _obscure = true;
  var _formkey = GlobalKey<FormState>();
  Map<String, String> _authData = {
    "email" : "",
    "password" : "",
  };
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

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
                Container(
                  alignment: Alignment.topCenter,
                  margin: EdgeInsets.only(top: 100),
                  child: ListView(
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                        margin: EdgeInsets.all(15),
                          child: ListTile(
                            enabled: true,
                            title: TextFormField(
                              autocorrect: true,
                              controller: email,
                              onSaved: (val){
                                _authData['email']  = val;
                              },
                              validator: (String value){
                                if(EmailValidator.validate(value)==false){
                                  return 'Please Enter a Valid Email ID';
                                }
                                else{
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.emailAddress,
                              keyboardAppearance: Brightness.dark,
                              style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.w400,color: Colors.white,shadows: [BoxShadow(color: Colors.black),BoxShadow(color: Colors.yellowAccent),],decorationStyle: TextDecorationStyle.solid),
                              decoration: InputDecoration(
                                suffixIcon: Icon(Icons.email,color: Colors.orange,),
                                border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.orange,style: BorderStyle.solid,width: 3)),
                                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.orange,style: BorderStyle.solid,width: 3)),
                                hintText: "Email",
                                hintStyle: TextStyle(color: Colors.white),
                                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.orange,style: BorderStyle.solid,width: 3)),
                                errorBorder:  UnderlineInputBorder(borderSide: BorderSide(color: Colors.red,style: BorderStyle.solid,width: 3)),
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
                          obscureText: _obscure,
                          style: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.w400,color: Colors.white,shadows: [BoxShadow(color: Colors.black),BoxShadow(color: Colors.yellowAccent),],decorationStyle: TextDecorationStyle.solid),
                          autocorrect: true,
                          controller: pass,
                          onSaved: (val){
                            _authData['password'] = val;
                          },
                          validator: (String value){
                            if(value.isEmpty){
                              return 'Please Enter a Password';
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
                            border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.orange,style: BorderStyle.solid,width: 3)),
                            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.orange,style: BorderStyle.solid,width: 3)),
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.orange,style: BorderStyle.solid,width: 3)),
                            hintStyle: TextStyle(color: Colors.white),
                            hintText: "Password",
                          ),
                        ),
                      ),),
                      Container(
                        margin: EdgeInsets.all(20),
                      ),
                      SizedBox(
                        width: 200,
                        height: 50,
                        child: RaisedButton(onPressed: () => {
                          submit(),
                        } ,shape: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),elevation: 4,color: Colors.orange,splashColor: Colors.deepOrange,textColor: Colors.black,padding: EdgeInsets.all(10),hoverColor: Colors.lightGreen,
                          child: Text('Login',style: TextStyle(fontWeight: FontWeight.w800,fontSize: 20),),),
                      ),
                      Container(
                        margin: EdgeInsets.all(20),
                        child: SizedBox(
                          width: 300,
                          height: 50,
                          child: RaisedButton(onPressed: () => Navigator.pushReplacement(
                            context,
                            FadeRoute(page: SignUp()),),shape: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),elevation: 4,color: Colors.orange,splashColor: Colors.deepOrange,textColor: Colors.black,padding: EdgeInsets.all(10),hoverColor: Colors.lightGreen,
                            child: Text('Sign Up',style: TextStyle(fontWeight: FontWeight.w800,fontSize: 20),),),
                        ),
                      ),
                    ],
                ),],),
                ),
              ],
            ),
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
      await Auth().signin(_authData['email'], _authData['password']);
      FirebaseAuth.instance.signInWithEmailAndPassword(email: _authData['email'], password: _authData['password']).then((signed){
        Navigator.pushReplacement(
          context,
          FadeRoute(page: Dashboard(email: _authData['email'],)),);
      }).catchError((e){
        print(e);
      });

    } on HttpException catch (e) {
      var errorMessage = 'Authentication Failed';
      if(e.toString().contains("EMAIL_NOT_FOUND")){
        errorMessage = "Email Not Found";
      }
      else if(e.toString().contains("INVALID_PASSWORD")){
        errorMessage = "Invalid Password ";
      }
      else if(e.toString().contains("USER_DISABLED")){
        errorMessage = "The account has been disabled by the administrator";
      }
      else{
        errorMessage = "Sign Up Failed";
      }
      _ackAlert(context, "Error", errorMessage, "Okay");
    } catch(Error){
      var message = 'Could Not Login, Please Check Your Network Connection';
      _ackAlert(context, "Error", message, "Okay");
    }
    setState(() {
      _isloading = false;
    });

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

