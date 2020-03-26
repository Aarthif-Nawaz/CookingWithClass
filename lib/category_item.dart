import 'package:flutter/material.dart';
import 'recipie_screen.dart';

class CategoryItem extends StatelessWidget {
  final String search;
  final String id;
  final String title;
  final String image;

  const CategoryItem({Key key, this.title, this.image,this.id,this.search}) : super(key: key);

  void Select(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (_){
      return RecipieScreen(id: id,title: title,);
    }));
  }
  @override
  Widget build(BuildContext context) {
    return search==null || search=="" ? InkWell(
      onTap:() => Select(context),
      splashColor: Colors.orangeAccent,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15))
        ),
        padding: EdgeInsets.all(10),
        child: GridTile(child: ClipRRect(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
            child: Image(image: AssetImage(image),fit: BoxFit.cover,filterQuality: FilterQuality.high,)),
          footer: Container(
            height: 50,
              color: Colors.black87,
              padding: EdgeInsets.all(10),
              child: Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,fontFamily: "Rubik",color: Colors.orange),textAlign: TextAlign.center,)),),
      ),
    ): CategorySelect();
  }
}
class CategorySelect extends StatelessWidget{
  final String search;
  final String id;
  final String image;
  final String title;

  const CategorySelect({Key key, this.id, this.image, this.title,this.search}) : super(key: key);

  void Select(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (_){
      return RecipieScreen(id: id,title: title,);
    }));
  }


  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap:() => Select(context),
      splashColor: Colors.orangeAccent,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15))
        ),
        padding: EdgeInsets.all(10),
        child: GridTile(child: ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(15),topRight: Radius.circular(15)),
            child: Image(image: AssetImage(image),fit: BoxFit.cover,filterQuality: FilterQuality.high,)),
          footer: Container(
              height: 50,
              color: Colors.black87,
              padding: EdgeInsets.all(10),
              child: Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,fontFamily: "Rubik",color: Colors.orange),textAlign: TextAlign.center,)),),
      ),
    );
  }

}
