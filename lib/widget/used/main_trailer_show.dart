import 'package:flutter/material.dart';
import 'package:netflix/widget/used/radius_button.dart';

import '../../colors.dart';


class MainTrailerShow extends StatefulWidget {
  final String imageUrl;
  final String name;
  final  String genre;
  final String year;


  MainTrailerShow({this.imageUrl, this.name, this.genre, this.year});

  @override
  _MainTrailerShowState createState() => _MainTrailerShowState();
}

class _MainTrailerShowState extends State<MainTrailerShow> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
        height: size.height * .6,
        child:Stack(children: [
          Container(  width: size.width*.8,
            height: size.height ,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(widget.imageUrl),
                    fit: BoxFit.cover)),
          ),
          Container(
            width: size.width,
            height: size.height,
            color: Colors.black.withOpacity(.2),
          ),
          Positioned(
            left: size.width * .03,
            top: size.height*.1,
            bottom: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: size.width * .3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: TextStyle(
                            color: textInfoColorNetflix,
                            fontWeight: FontWeight.bold,
                            fontSize: size.width * .025),
                      ),
                      SizedBox(
                        height: size.height * .015,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                           widget.genre,
                            style: TextStyle(
                                color: textInfoColorNetflix,
                                fontWeight: FontWeight.w500,
                                fontSize: size.width * .012),
                          ),
                          SizedBox(width: size.width*.02,),
                          Text(
                            widget.year,
                            style: TextStyle(
                                color: textInfoColorNetflix, fontSize: size.width * .012),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height*.02,),
                      Text(
                        'A lonely young woman, Sintel, helps and befriends a dragon,\nwhom she calls Scales. But when he is kidnapped by an adult\n'
                            'dragon, Sintel decides to embark on a dangerous quest to find\n'
                            'her lost friend Scales.',
                        style: TextStyle(
                            color: textInfoColorNetflix,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.1),
                      ),
                      SizedBox(
                        height: size.height * .05,
                      ),
                      Container(
                        width: size.width * .26,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RadiusButton(
                              title: "Play Trailer",
                              icon: Icons.play_arrow,
                              textColor: mainColorNetflix,),
                            RadiusButton(
                              color: Colors.blue,
                                title: "Learn More", icon: Icons.add, textColor: textInfoColorNetflix)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * .1,
                ),
              ],
            ),
          ),

        ],)
    );
  }
}
