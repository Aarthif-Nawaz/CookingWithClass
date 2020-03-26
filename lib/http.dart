import 'package:http/http.dart' as http;
import 'dart:convert';

class HTTP{


  Future<void> signup(String email, String id) async{
    final url = "https://cooking-with-class.firebaseio.com/users.json";
    final response = await http.post(url,body: json.encode({
      'email':email,
      'userID':id,
    }));
  }

  Future<void> addrecipies(String id,bool ispurchased) async{
    final url = "https://cooking-with-class.firebaseio.com/users/recipies.json";
    final response = await http.post(url,body: json.encode({
      'id':id,
      'isPurchased':ispurchased,
    }));
  }
  Future<void> fetchandSetRecipies(String id,bool ispurchased) async {
    const url = "https://cooking-with-class.firebaseio.com/users/recipies.json";
    final response = await http.get(url);
    try {
      final responseData = json.decode(response.body) as Map<String, dynamic>;
      for(var i in responseData.values){
        print(i);
        if(i.toString().contains(id)){
          return;
        }
        else{
          addrecipies(id,ispurchased);
        }
      }
    }catch(Error){
      addrecipies(id,ispurchased);
    }
  }
}