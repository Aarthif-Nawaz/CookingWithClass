import 'package:flutter/material.dart';
import 'meal_screen.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String mealID;
  final String title;
  final String image;
  final int Duration;
  final List<String> imgs;

  const MealItem({Key key, this.id, this.title, this.image, this.Duration,this.imgs,this.mealID}) : super(key: key);

  void selectMeal(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_){
      return MealScreen(imgs: imgs,id: mealID,title: title,image: image,);
    }));

  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      splashColor: Colors.white10,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
                  child: Image(image: AssetImage(image),height: MediaQuery.of(context).size.height*0.4,width: double.infinity,fit: BoxFit.cover,),
                ),
              ],
            ),
           Container(
                color: Colors.black87,
                width: double.infinity,
                child: Row(
                    children: <Widget>[
                      Container(
                        child: Row(children: <Widget>[
                          IconButton(icon: Icon(Icons.access_time,color: Colors.orange,size: 20,), onPressed: null),
                          SizedBox(width: 7,),
                          Text('$Duration hrs',style: TextStyle(fontFamily: "Rubik",fontSize: 20,fontWeight: FontWeight.bold,color: Colors.orange),),
                          SizedBox(width: 60,),
                          Text(title,softWrap: true,overflow: TextOverflow.visible,style: TextStyle(fontFamily: "Rubik",fontSize: 20,fontWeight: FontWeight.bold,color: Colors.orange),),
                        ],),
                      ),
                    ],
                  ),
              ),
          ],
        ),
      ),
    );
  }
}
