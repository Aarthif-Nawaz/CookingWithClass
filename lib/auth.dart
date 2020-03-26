import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'httpException.dart';
import 'dart:async';
import 'login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'http.dart';
import 'usermanagement.dart';

class Auth {
  String _token;
  DateTime _expiryDate;
  String _userID;
  Timer _autolog;
  BuildContext _context;
  int expiry;

  bool get isAuth{
    return token != null;
  }
  String get token{
    if(_expiryDate != null && _expiryDate.isAfter(DateTime.now())&& _token != null){
      return _token;
    }
    return null;
  }


  Future<void> signup(String email,String password,context) async{
    const url = "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyD7sQcVdtUmNNMfYX519p20ZP1ksxdAwQM";
    try {
      final response = await http.post(url,body: json.encode({
        'email': email,
        'password': password,
        'returnSecureToken' : true,
          },
        ),
      );
      final responseData = json.decode(response.body);
      if(responseData['error'] != null){
        throw HttpException(responseData['error']['message']);
      }
      _token = responseData['idToken'];
      _userID = responseData['localId'];
      _expiryDate = DateTime.now().add(Duration(seconds: int.parse(responseData['expiresIn']),),);

      if(response.statusCode==200){
        await HTTP().signup(responseData['email'], responseData['localId']);
        UserManagement().StoreNewUser(responseData, context, email);
      }
      autoLogout();
    } on Exception catch (e) {
      throw e;
    }
    
  }
  Future<void> signin(String email, String password) async{
    const url = "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyD7sQcVdtUmNNMfYX519p20ZP1ksxdAwQM";
    try {
      final response = await http.post(url,body: json.encode({
        'email': email,
        'password': password,
        'returnSecureToken' : true,
          },
        ),
      );
      final responseData = json.decode(response.body);
      if(responseData['error'] != null){
        throw HttpException(responseData['error']['message']);
      }
      _token = responseData['idToken'];
      _userID = responseData['localId'];
      _expiryDate = DateTime.now().add(Duration(seconds: int.parse(responseData['expiresIn']),),);
      autoLogout();
      final prefs = await SharedPreferences.getInstance();
      final userData = json.encode(
        {
          'token': _token,
          'userId': _userID,
          'expiryDate': _expiryDate.toIso8601String(),
        },
      );
      prefs.setString('userData', userData);
    } on Exception catch (e) {
      throw e;
    }

    

  }
  Future<bool> tryAutoLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey('userData')) {
      return false;
    }
    final extractedUserData = json.decode(prefs.getString('userData')) as Map<String, Object>;
    final expiryDate = DateTime.parse(extractedUserData['expiryDate']);

    if (expiryDate.isBefore(DateTime.now())) {
      return false;
    }
    _token = extractedUserData['token'];
    _userID = extractedUserData['userId'];
    _expiryDate = expiryDate;
    autoLogout();
    return true;
  }
  void logout(){
    _token = null;
    _expiryDate = null;
    _userID = null;
    if(_autolog != null){
      _autolog.cancel();
      _autolog = null;
    }
  }
  void autoLogout(){
    if(_autolog != null){
      _autolog.cancel();
    }
    expiry = _expiryDate.difference(DateTime.now()).inSeconds;
    _autolog = Timer(Duration(seconds: expiry), logout);


  }


}