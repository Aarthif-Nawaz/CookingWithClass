import 'package:flutter/material.dart';
import 'meal_screen.dart';
class HotItem extends StatelessWidget{
  final String title;
  final String categoryID;
  final String MealID;
  final String image;
  final List<String> images;
  final int Duration;

  const HotItem({Key key, this.title, this.categoryID, this.MealID, this.image, this.images, this.Duration}) : super(key: key);

  void selectMeal(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_){
      return MealScreen(imgs: images,id: MealID,title: title,image: image,);
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