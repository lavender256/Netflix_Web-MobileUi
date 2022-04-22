import 'package:flutter/material.dart';
import 'package:netflix/widget/used/radius_button.dart';
import 'package:netflix/widget/used/slide_fade_trasnsition.dart';

import '../../colors.dart';

class MainFilmShow extends StatefulWidget {
  final String imageUrl;
  final String name;

  MainFilmShow({this.imageUrl,this.name});

  @override
  _MainFilmShowState createState() => _MainFilmShowState();
}

class _MainFilmShowState extends State<MainFilmShow> {
  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(  margin: EdgeInsets.only(left: isDrawerOpen? size.width*.195:0),
      height: size.height * .83,
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(left: size.height * .05),
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                  alignment: Alignment.topCenter,
                    image: NetworkImage(widget.imageUrl),
                   fit: BoxFit.cover)),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.black,
                  Colors.black.withOpacity(.5),
                  Colors.black.withOpacity(.2),
                  Colors.transparent
                ])),
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
                  width: size.width * .4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SlideFadeTransition(
                        curve: Curves.elasticOut,
                        delayStart: Duration(milliseconds: 500),
                        animationDuration: Duration(milliseconds: 1200),
                        offset: 2.5,
                        direction: Direction.horizontal,
                        child: Text(
                          widget.name,
                          style: TextStyle(
                              color: textInfoColorNetflix,
                              fontWeight: FontWeight.bold,
                              fontSize: size.width * .037),
                        ),
                      ),
                      SizedBox(
                        height: size.height * .015,
                      ),
                      SlideFadeTransition(
                        curve: Curves.elasticOut,
                        delayStart: Duration(milliseconds: 500),
                        animationDuration: Duration(milliseconds: 1200),
                        offset: 2.5,
                        direction: Direction.horizontal,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "2019",
                              style: TextStyle(
                                  color: textInfoColorNetflix, fontSize: size.width * .015),
                            ),
                            Container(
                              height: size.height * .05,
                              width: size.width * .06,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                border: Border.all(color: textInfoColorNetflix, width: 2),
                              ),
                              child: Center(
                                child: Text(
                                  "17 +",
                                  style: TextStyle(
                                      color: textInfoColorNetflix,
                                      fontWeight: FontWeight.w500,
                                      fontSize: size.width * .015),
                                ),
                              ),
                            ),
                            Text(
                              "IMDB 9.1",
                              style: TextStyle(
                                  color: textInfoColorNetflix, fontSize: size.width * .015),
                            ),
                            Text(
                              "1 h  56min",
                              style: TextStyle(
                                  color: textInfoColorNetflix, fontSize: size.width * .015),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * .05,
                      ),
                      SlideFadeTransition(
                        curve: Curves.elasticOut,
                        delayStart: Duration(milliseconds: 500),
                        animationDuration: Duration(milliseconds: 1200),
                        offset: 2.5,
                        direction: Direction.horizontal,
                        child: Text(
                          'A lonely young woman, Sintel, helps and befriends a dragon,\nwhom she calls Scales. But when he is kidnapped by an adult\n'
                              'dragon, Sintel decides to embark on a dangerous quest to find\n'
                              'her lost friend Scales.',
                          style: TextStyle(
                              color: textInfoColorNetflix,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1.1),
                        ),
                      ),
                      SizedBox(
                        height: size.height * .07,
                      ),
                      SlideFadeTransition(
                        curve: Curves.elasticOut,
                        delayStart: Duration(milliseconds: 500),
                        animationDuration: Duration(milliseconds: 1200),
                        offset: 2.5,
                        direction: Direction.horizontal,
                        child: Container(
                          width: size.width * .26,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RadiusButton(
                                  title: "Play",
                                  icon: Icons.play_arrow,
                                textColor: mainColorNetflix,),
                              RadiusButton(
                                  title: "My List", icon: Icons.add, textColor: textInfoColorNetflix)
                            ],
                          ),
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

        ],
      ),
    );
  }
}
