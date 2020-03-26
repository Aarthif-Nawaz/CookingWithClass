import 'package:flutter/material.dart';
import 'category_item.dart';
import 'category_recipie.dart';
import 'package:flutter/cupertino.dart';
import 'hot_screen.dart';
import 'auth.dart';
import 'login.dart';

class Dashboard extends StatefulWidget {
  final String email;

  const Dashboard({Key key, this.email}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int val = 0;
  static var filter = "";
  void _settingModalBottomSheet(context){
    showModalBottomSheet(
        backgroundColor: Colors.white10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),),
        elevation: 7,
        context: context,
        builder: (BuildContext bc){
          return Container(
            height: MediaQuery.of(context).size.height*0.4,
              child: CupertinoPicker(
                      backgroundColor: Colors.black87,
                      itemExtent: 40,
                      looping: false,
                      children: [
                        Text('Pastries',softWrap: true,style: TextStyle(fontSize: 22,color: Colors.orange,fontWeight: FontWeight.bold,fontFamily: "Rubik",),),
                        Text('Desserts',softWrap: true,style: TextStyle(fontSize: 22,color: Colors.orange,fontWeight: FontWeight.bold,fontFamily: "Rubik",),),
                        Text('Festive Rice',softWrap: true,style: TextStyle(fontSize: 22,color: Colors.orange,fontWeight: FontWeight.bold,fontFamily: "Rubik",),),
                        Text('Cup Cakes',softWrap: true,style: TextStyle(fontSize: 22,color: Colors.orange,fontWeight: FontWeight.bold,fontFamily: "Rubik",),),
                        Text('Cakes Festival',softWrap: true,style: TextStyle(fontSize: 22,color: Colors.orange,fontWeight: FontWeight.bold,fontFamily: "Rubik",),),
                        Text('Chinese Cookery',softWrap: true,style: TextStyle(fontSize: 22,color: Colors.orange,fontWeight: FontWeight.bold,fontFamily: "Rubik",),),
                      ],
                  onSelectedItemChanged: (int index){
                      setState(() {
                        try {
                          if (index == 0) {
                            filter = "Pastries";
                          }
                          else if (index == 1) {
                            filter = "Desserts";
                          }
                          else if (index == 2) {
                            filter = "Festive Rice";
                          }
                          else if (index == 3) {
                            filter = "Cup Cakes";
                          }
                          else if (index == 4) {
                            filter = "Cakes Festival";
                          }
                          else if (index == 5) {
                            filter = "Chinese Cookery";
                          }
                        }catch(RangeError){
                          filter = "";
                        }
                      });
                  },
              ),
          );
        }
    );
  }



  int _cIndex = 0;

  void _incrementTab(index) {
    setState(() {
      _cIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    final category_meals1 = Category_recipie.indexWhere((cat){
      if(filter != null){
        return cat.title.contains(filter);
      }
      else{
        return null;
      }
    });
    final category_meals = Category_recipie.map((cat){
     return cat;
    }).toList();
    final category_meals2 = Category_recipie.where((cat){
      return cat.title.contains('Pastries');
    }).toList();

    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0),side: BorderSide(style: BorderStyle.solid),),
        title: Text('My Recipies',style: TextStyle(color: Colors.orange),),elevation: 20,brightness: Brightness.dark,centerTitle: true,actions: <Widget>[
          IconButton(icon: Icon(Icons.search,color: Colors.orange,), onPressed: () {
            val = 1;
            _settingModalBottomSheet(context);
          }),
          IconButton(icon: Icon(Icons.exit_to_app,color: Colors.orange,), onPressed: (){
            Auth().logout();
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_){
              return Login();
            }));
          })
        ],),
      drawer: Drawer(
        elevation: 4,
        child: Container(
          color: Colors.black87,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height*0.4,
                  child: Stack(children: <Widget>[
                  Image(image: AssetImage('Images/top.jpg'),fit: BoxFit.fill,filterQuality: FilterQuality.high,width: MediaQuery.of(context).size.width*0.8,colorBlendMode: BlendMode.darken,color: Colors.black.withOpacity(0.75),),
                    Positioned(
                      top: 90,
                      left: 80,
                      child: CircleAvatar(backgroundColor: Colors.orange,child: Text(widget.email.substring(0,1).toUpperCase(),style: TextStyle(color: Colors.black,fontSize: 30),),radius: 70,),),
                  ],
                ),),
                SizedBox(height: 30,),
                InkWell(
                  splashColor: Colors.orange,
                  hoverColor: Colors.orange,
                  onTap: ()  {
                    setState(() {
                      val = 0;
                    });
                  },
                  child: ListTile(
                    leading: IconButton(icon: Icon(Icons.category,color: Colors.orange,size: 20,), onPressed: (){


                    }),
                    title: Text('Categories',style: TextStyle(fontWeight: FontWeight.w700,color: Colors.orangeAccent,fontSize: 20),),
                  ),
                ),
                InkWell(
                  splashColor: Colors.orange,
                  hoverColor: Colors.orange,
                  onTap: () => {},
                  child: ListTile(
                    leading: IconButton(icon: Icon(Icons.info_outline,color: Colors.orange,size: 20,), onPressed: null),
                    title: Text('About',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.orangeAccent,fontSize: 20),),
                  ),
                ),
                SizedBox(height: 20,),
                Divider(color: Colors.orange,height: 15,),
                InkWell(
                  splashColor: Colors.orange,
                  hoverColor: Colors.orange,
                  onTap: () => {
                  Navigator.of(context).pop(),
                    Auth().logout(),
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_){
                  return Login();
                  })),
                  },
                  child: ListTile(
                    leading: IconButton(icon: Icon(Icons.exit_to_app,color: Colors.orange,size: 20,), onPressed: (){
                      Navigator.of(context).pop();
                      Auth().logout();
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_){
                        return Login();
                      }));
                    }),
                    title: Text('Log Out',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.orangeAccent,fontSize: 20),),
                  ),
                ),
                InkWell(
                  splashColor: Colors.orange,
                  hoverColor: Colors.orange,
                  onTap: () => {},
                  child: ListTile(
                    leading: IconButton(icon: Icon(Icons.help,color: Colors.orange,size: 20,), onPressed: null),
                    title: Text('Help',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.orangeAccent,fontSize: 20),),
                  ),
                ),

              ],
            ),
        ),
    ),
    backgroundColor: Colors.white10,
    bottomNavigationBar:Theme(data: Theme.of(context).copyWith(
        canvasColor: Colors.black12,
        // sets the active color of the `BottomNavigationBar` if `Brightness` is light
        primaryColor: Colors.red,
        textTheme: Theme
            .of(context)
            .textTheme
            .copyWith(caption: new TextStyle(color: Colors.yellow))), child:BottomNavigationBar(backgroundColor: Colors.black12 ,currentIndex : _cIndex,elevation: 20,items: [
        BottomNavigationBarItem(icon: IconButton(icon: Icon(Icons.category,color: Colors.orange,),onPressed: (){
          setState(() {
            val = 0;
          });

        }),title: Text('Categories',style: TextStyle(color: Colors.orange,fontSize: 20,fontWeight: FontWeight.w600),),),
        BottomNavigationBarItem(icon: IconButton(icon: Icon(Icons.search,color: Colors.orange,),onPressed: () {
          val = 1;
          _settingModalBottomSheet(context);
        }),title: Text('Search',style: TextStyle(color: Colors.orange,fontSize: 20,fontWeight: FontWeight.w600),),),
      BottomNavigationBarItem(icon: IconButton(icon: Icon(Icons.trending_up,color: Colors.orange,), onPressed: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (_){
          return HotScreen();
        }));
      }),title: Text('Hot Picks',softWrap: true,style: TextStyle(color: Colors.orange,fontSize: 20,fontWeight: FontWeight.w600),),),
      BottomNavigationBarItem(icon: IconButton(icon: Icon(Icons.playlist_add_check,color: Colors.orange,), onPressed: null),title: Text('My List',style: TextStyle(color: Colors.orange,fontSize: 20,fontWeight: FontWeight.w600),))],
        onTap:(index) => _incrementTab(index),),
    ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white10,
          ),
          Container(
            child: GridView(gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 500,
              childAspectRatio: 2/2,

            ), children:
                (val ==1)? category_meals2.map((val){
              return CategorySelect(
              title: category_meals[category_meals1].title,
              image: category_meals[category_meals1].image,
              id: category_meals[category_meals1].id,
              search: filter,);

                }).toList()



              : Category_recipie.map((cat) {

                  return CategoryItem(title: cat.title,image: cat.image,id: cat.id,search: null,);

              }
            ,).toList(),
            ),
          )
        ],
      ),
     );
  }
}
