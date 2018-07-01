
import 'package:flutter/material.dart';


class SignUp extends StatelessWidget {

  final String text;
  final TextAlign textAlign;
  final TextOverflow textOverflow;
  final bool softWrap;
  final Color hint_color;

  final double fontSize;

  final String fontFamily;

  final Color color;
  final List<double> padding;
  final VoidCallback callback;
  final FontWeight fontWeight;



  SignUp({this.text,this.fontWeight, this.callback,this.padding,this.textAlign, this.textOverflow, this.softWrap,
      this.hint_color, this.fontSize, this.fontFamily, this.color});

  @override

  Widget build(BuildContext context) {

    return (new FlatButton(

      padding:  EdgeInsets.only(

        top:padding[1],

      ),

      onPressed: callback,

      child: new Text(

        "Don't have an account? Sign Up",

        textAlign: textAlign,

        overflow: textOverflow,

        softWrap: override,

        style: new TextStyle(

            fontWeight: fontWeight,

            letterSpacing: 0.5,

            color: color,

            fontSize: fontSize,
        fontFamily: fontFamily),

      ),

    ));

  }

}