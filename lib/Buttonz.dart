import 'package:flutter/material.dart';



class SignIn extends StatelessWidget {

  final String button_name;
  final Color buttonColor;
  final VoidCallback callback;
  final double radius;
  final Color textColor;

  final String fontFamily;
  final double fontSize;
  final FontWeight fontWeight;
  final  double letterSpacing;

  final double containerWidth;
  final double containerHeight;


  SignIn({this.containerHeight,this.containerWidth,this.button_name,this.fontWeight,this.callback,this.letterSpacing,this.fontFamily,this.fontSize,this.buttonColor,this.radius,this.textColor});

  @override

  Widget build(BuildContext context) {

    return (new Container(

      width:containerWidth,

      height: containerHeight,

      alignment: FractionalOffset.center,

      decoration: new BoxDecoration(

        color: buttonColor,

        borderRadius: new BorderRadius.all( Radius.circular(radius)),

      ),

      child: new Text(

        button_name,

        style: new TextStyle(

          color: textColor,

          fontSize:fontSize,

          fontWeight: fontWeight,

          letterSpacing: 0.3,

        ),

      ),

    ));

  }
/**  new SizedBox(
    width: 340.0,
    height: 50.0,
    child: new  RaisedButton(onPressed: null,
    child: new Text(
    'Confirm',
    style: new TextStyle(
    fontFamily: 'Jua',
    letterSpacing: 1.0,
    fontSize: 18.0,
    color: Colors.white70,
    ),
    ),
    shape: new RoundedRectangleBorder(side: new BorderSide(
    color: Colors.midnightAccent,
    width: 2.0,

    ),
    borderRadius:new BorderRadius.circular(20.0)


    ),
    color: Colors.transparent,
    elevation: 10.0,



    ),
    ),*/
}