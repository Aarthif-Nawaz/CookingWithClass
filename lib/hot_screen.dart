import 'package:flutter/material.dart';
import 'category_recipie.dart';
import 'hot_item.dart';

class HotScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    final hot_picks = Hot_picks.map((meal){
      return meal;
    }).toList();
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0),side: BorderSide(style: BorderStyle.solid),),
        title: Text('Hot Picks',style: TextStyle(color: Colors.orange),),elevation: 20,brightness: Brightness.dark,centerTitle: true,actions: <Widget>[
          IconButton(icon: Icon(Icons.playlist_add_check,color: Colors.orange,), onPressed: null),
        ],),
      backgroundColor: Colors.white10,
      body: ListView.builder(itemBuilder: (ctx,int index){
        return HotItem(categoryID: hot_picks[index].categoryid,image: hot_picks[index].categoryimg,title: hot_picks[index].title,MealID: hot_picks[index].recipieid,images: hot_picks[index].recipieimg,Duration: hot_picks[index].duration,);
      },itemCount: hot_picks.length,),
    );
  }

}