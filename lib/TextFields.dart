/**Use This File to Create Sorts of text input fields, forms etc*/
import 'package:flutter/material.dart';

///Normal TextField
var _fonts=const ['Anton','Audiowide','ExoBlack','ExoBold','ExoLight','Exo','GochiHand','Inconsolata','Jua','IndieFlower','Monoton','Pacifico','PassionOne','PoorStory'];
TextField normalTextField({String hint='',FontWeight type=FontWeight.normal,num size=14.0,int fontPos:1,Color colour=Colors.black})
{
  return new TextField(
    decoration: new InputDecoration(
      hintText: hint,
      hintStyle: new TextStyle(
        fontWeight: type,
        fontSize: size,
        fontFamily:_fonts[fontPos],
        color: colour,
      )
    ),
  );
}