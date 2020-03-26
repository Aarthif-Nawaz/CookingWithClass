import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'category_recipie.dart';
import 'http.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stripe_payment/stripe_payment.dart';
import 'paymentService.dart';

class MealScreen extends StatefulWidget {
  final String image;
  final String title;
  final List<String> imgs;
  final String id;

  const MealScreen({Key key, this.title, this.imgs, this.id,this.image}) : super(key: key);

  @override
  _MealScreenState createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  bool check = false;
  var _list = [];
  PageController _pageController;
  int current = 0;

  // ignore: must_call_super
  @override
  void initState(){
    _pageController = PageController(initialPage: current,viewportFraction: 0.6);
    super.initState();
    StripeSource.setPublishableKey('pk_live_rQmlMovTLUS4Uj4crk66BwlO00cFqP7AQ6');

  }
  @override
  void didChangeDependencies() async{
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    FixedExtentScrollController fixedExtentScrollController = new FixedExtentScrollController();
    return Scaffold(
    appBar: AppBar(backgroundColor: Colors.black,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0),side: BorderSide(style: BorderStyle.solid),),
    title: Text(widget.title,style: TextStyle(color: Colors.orange),),elevation: 20,brightness: Brightness.dark,centerTitle: true,actions: <Widget>[
    IconButton(icon: Icon(Icons.playlist_add_check,color: Colors.orange,), onPressed: null),
    ],),
      body: Stack(
        children : <Widget> [
          Container(
              width: double.infinity,
              height: double.infinity,
              child: Image(image: AssetImage(widget.image),fit: BoxFit.cover,colorBlendMode: BlendMode.darken,color: Colors.black.withOpacity(0.75),)),
          ListView(
          children: [
            Container(
              margin: EdgeInsets.only(top: 50),
              child: Text('Varieties Of '+ widget.title,textAlign: TextAlign.center,style: TextStyle(fontFamily: "Lobster",color: Colors.orange,fontSize: 28,fontWeight: FontWeight.w600),),
        ),
            Container(
            margin: EdgeInsets.only(top: 70),
            width: double.infinity,
            height: 300,
            child: PageView.builder(
                  onPageChanged: (value){
                    setState(() {
                      current = value;
                    });
                  },
                  itemCount: widget.imgs.length,
                    controller: _pageController,
                    itemBuilder: (context,position){
                      return imageSlider(position);
                    }
            ),
          ),]
        ,),
          Positioned(
            bottom: 30,
              right: 20,
              child: FloatingActionButton(
                backgroundColor: Colors.orange,
                  child: Icon(check ? Icons.playlist_add_check : Icons.playlist_add,color: Colors.black,),
                  elevation: 8,
                  hoverColor: Colors.deepOrange,
                  shape: OutlineInputBorder(borderRadius: BorderRadius.circular(50),borderSide: BorderSide(style: BorderStyle.solid)),
                  onPressed: () async {
                    const url = "https://cooking-with-class.firebaseio.com/users/recipies.json";
                    final response = await http.get(url);
                    final responseData = json.decode(response.body) as Map;
                    try {
                      responseData.forEach((id,value){
                        _list.add(value['id']);
                      });
                      if(_list.contains(widget.id)){
                        setState(() {
                          check = true;
                        });
                        _ackAlert(context, "Recipie Added", "Recipie already added to the list", "OK");
                      }
                      else{
                        StripeSource.addSource().then((token){
                          PaymentService().addCard(token);
                        });
                        HTTP().addrecipies(widget.id, true);
                        setState(() {
                          check = true;
                        });
                      }
                    }catch(Error){
                      HTTP().addrecipies(widget.id, true);
                      setState(() {
                        check = true;
                      });
                    }
                  }
                  )),
        ],
      ),

    );

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
  imageSlider(int position) {
    return AnimatedBuilder(
        animation: _pageController,
        builder: (context,widget){
          double value = 1;
          if(_pageController.position.haveDimensions){
            value = _pageController.page - position;
            value = (1- (value.abs()*0.3)).clamp(0.0, 1.0);
          }
          return Container(
            child: SizedBox(
              height: Curves.easeInOut.transform(value)*300,
              width: Curves.easeInOut.transform(value)*250,
              child: widget,
            ),
          );
        },
      child: Container(
        margin: EdgeInsets.all(10),
        child: Card(
          elevation: 7,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),side: BorderSide(color: Colors.orange,style: BorderStyle.solid,width: 6)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
              child: Image(image: AssetImage(widget.imgs[position]),fit: BoxFit.fill,filterQuality: FilterQuality.high,width: double.infinity,)),
        ),
      ),
        );
  }
}

