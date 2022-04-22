import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:netflix/colors.dart';
import 'package:netflix/models/film_model.dart';
import 'package:netflix/screens/desktop/trailer_screen_desktop.dart';

class TrailerCard extends StatelessWidget {
  final Film  film;
  final int index;
  final bool isVertical;


  TrailerCard({this.film, this.index,this.isVertical=false});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AnimationConfiguration.staggeredList(
      position: index,
      delay: Duration(milliseconds: 100),
      child: SlideAnimation(
        duration: Duration(milliseconds: 5500),
        curve: Curves.fastLinearToSlowEaseIn,
        horizontalOffset: 30,
        verticalOffset: 300,
        child: FlipAnimation(
          duration: Duration(milliseconds: 3000),
          curve: Curves.fastLinearToSlowEaseIn,
          flipAxis: FlipAxis.y,
          child: GestureDetector(
            onTap: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (_) => TrailerScreenDesktop(
                      imageUrl: film.imageUrl2,
                      name: film.name,
                      year: film.year,
                      genre: film.genre,
                    ))),
            child: Container(
              margin: EdgeInsets.only(
                 right: size.width*.02,
                  bottom: isVertical ? size.height * .02 : 0),
              width: size.width * .18,
              height: size.height * .3,
              child: Column(
                children: [
                  Container(
                    width: size.width * .2,
                    height: size.height * .2,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(film.imageUrl2),
                            fit: BoxFit.cover)),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * .02),
                    width: size.width * .2,
                    height: size.height * .1,
                    color: isVertical?mainColorNetflix:Colors.black,
                    child: Column(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          film.name,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: size.width * .01),
                        ),
                        Row(
                          children: [
                            Text(
                              film.genre,
                              style: TextStyle(
                                  color: Colors.white54,
                                  fontWeight: FontWeight.w500,
                                  fontSize: size.width * .008),
                            ),
                            SizedBox(
                              width: size.width * .01,
                            ),
                            Text(film.year,
                                style: TextStyle(
                                    color: Colors.white54,
                                    fontWeight: FontWeight.w500,
                                    fontSize: size.width * .008)),
                          ],
                        )
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
