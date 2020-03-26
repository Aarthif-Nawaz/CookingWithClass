import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
class Animations extends StatelessWidget{

  final String text_1;
  Animations(this.text_1);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: TyperAnimatedTextKit(
          onTap: () {
            print("Tap Event");
          },
          text: [
              text_1,
          ],
          textStyle: TextStyle(
              fontSize: 32.0,
              fontFamily: "Lobster",
            fontWeight: FontWeight.w200,
            fontStyle: FontStyle.italic,
            color: Colors.orange
          ),
          textAlign: TextAlign.start,
          alignment: AlignmentDirectional.topStart // or Alignment.topLeft
      ),
    );
  }

}