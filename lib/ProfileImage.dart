import 'package:flutter/material.dart';
class ProfileImage extends StatelessWidget{

  final ImageProvider image;
  final Color color;
  final double width;
  final double height;
  final BoxShape shape;
  final String initials;
  final bool defaultImg;
  final bool isFill;
  final Color fill;


  const ProfileImage(@required this.defaultImg,@required this.isFill,{
    this.shape,
    this.image,
    this.color,
    this.height,
    this.initials,
    this.width,
    this.fill,
  });
  @override
  Widget build(BuildContext context) {
    return defaultImg ?  new Container(

        width: width,


        height: height,

            child: new Center(
              child: new Text(initials,style: new TextStyle(
                fontSize: 40.0,
                fontFamily: 'Jua',
                color: Colors.white,

              ))),
                decoration: new BoxDecoration(
                  color: isFill||fill!=null ? fill:Colors.transparent,
                  border: new Border.all(color: color,width: 5.0),
              shape: shape,
             // color: color,


            ))
           :

      (new Container(

            width: width,

            height: height,

            decoration:
            new BoxDecoration(

                shape: shape,

                image: new DecorationImage(

                    fit: BoxFit.fill,

                    image: image

                )

            )));

  }
}