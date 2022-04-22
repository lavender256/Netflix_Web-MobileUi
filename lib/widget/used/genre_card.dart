import 'package:flutter/material.dart';
import 'package:netflix/responsive.dart';

class GenreCard extends StatelessWidget {

  final String title;
  final Color color;

  GenreCard({this.title, this.color});

  @override
  Widget build(BuildContext context) {   var size = MediaQuery.of(context).size;
    return Container(
      height:Responsive.isDesktop(context)?size.height*.05:size.height*.07,
      width: Responsive.isDesktop(context)?size.width*.07:size.width*.25,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(25)
      ),
      child: Center(child: Text(title,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w900),),),
    );
  }
}
