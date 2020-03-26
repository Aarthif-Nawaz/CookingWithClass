import 'package:flutter/material.dart';
import 'category_recipie.dart';
import 'meal_item.dart';
import 'package:flutter/cupertino.dart';

class RecipieScreen extends StatefulWidget {
  final String id;
  final String title;

  const RecipieScreen({Key key, this.id, this.title}) : super(key: key);

  @override
  _RecipieScreenState createState() => _RecipieScreenState();
}

class _RecipieScreenState extends State<RecipieScreen> {
  static var filter = "Buns";
  var value = 0;



  @override
  Widget build(BuildContext context) {
    final FixedExtentScrollController fixedExtentScrollController = new FixedExtentScrollController();
    final recipieMeals = Recipie_meals.where((meal){
      return meal.categoryid.contains(widget.id);
    }).toList();

    final SelectedMeal = recipieMeals.where((meal){
      return meal.title.contains(filter);
    }).toList();

    final indexOf = recipieMeals.indexWhere((meal){
      if(filter != null){
        return meal.title.contains(filter);
      }
      else{
        return null;
      }
    });

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0),side: BorderSide(style: BorderStyle.solid),),
        title: Text(widget.title,style: TextStyle(color: Colors.orange),),elevation: 20,brightness: Brightness.dark,centerTitle: true,actions: <Widget>[
          IconButton(icon: Icon(Icons.search,color: Colors.orange,), onPressed: (){
            value = 1;
            _settingModalBottomSheet(context);
          }),
          IconButton(icon: Icon(Icons.playlist_add_check,color: Colors.orange,), onPressed: null),
        ],),
      backgroundColor: Colors.white10,
      body: (value != 1) ? ListView.builder(itemBuilder: (ctx, index){
        return MealItem(title: recipieMeals[index].title,id: recipieMeals[index].categoryid,image: recipieMeals[index].categoryimg,Duration: recipieMeals[index].duration,imgs: recipieMeals[index].recipieimg,mealID: recipieMeals[index].recipieid,);
      },
      itemCount: recipieMeals.length,
      ): ListView.builder(itemBuilder: (ctx, indexOf){
        return MealItem(title: SelectedMeal[indexOf].title,Duration: SelectedMeal[indexOf].duration,image: SelectedMeal[indexOf].categoryimg,imgs: SelectedMeal[indexOf].recipieimg,mealID: SelectedMeal[indexOf].recipieid,id: SelectedMeal[indexOf].categoryid,);
      },
        itemCount: SelectedMeal.length,),



    );

  }
  void _settingModalBottomSheet(context){
    final recipieMeals = Recipie_meals.where((meal){
      return meal.categoryid.contains(widget.id);
    }).toList();
    showModalBottomSheet(
        backgroundColor: Colors.black87,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),
        elevation: 7,
        context: context,
        builder: (BuildContext bc){
          return Container(
              height: MediaQuery.of(context).size.height*0.5,
              child: CupertinoPicker.builder(
                backgroundColor: Colors.black87,
                  itemExtent: 60,
                  magnification: 1.0,
                  onSelectedItemChanged: (int index){
                    setState(() {
                      filter = recipieMeals[index].title;
                    });
                  },
                  childCount: recipieMeals.length,
                  itemBuilder: (context,index){
                    return Text(recipieMeals[index].title,softWrap: true,style: TextStyle(fontSize: 22,color: Colors.orange,fontWeight: FontWeight.bold,fontFamily: "Rubik",),);
                  } )
          );
        }
    );
  }
}
