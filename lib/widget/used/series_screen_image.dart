import 'package:flutter/material.dart';
import 'package:netflix/models/film_model.dart';
import 'package:netflix/widget/used/series_screen_image_button.dart';

import 'custom_vertical_divider.dart';

class SeriesScreenImage extends StatefulWidget {
  final Film film;

  SeriesScreenImage({this.film});

  @override
  _SeriesScreenImageState createState() => _SeriesScreenImageState();
}

class _SeriesScreenImageState extends State<SeriesScreenImage> {
  bool isFavorite=true;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height * .7,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(widget.film.imageUrl1), fit: BoxFit.cover)),
      child: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height * .7,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.transparent,
              Colors.transparent,
              Colors.transparent,
              Colors.black.withOpacity(.2),
              Colors.black.withOpacity(.5),
              Colors.black,
              Colors.black
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: size.width * .15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: size.height * .09,
                        height: size.height * .09,
                        decoration: BoxDecoration(
                            color: Colors.red, shape: BoxShape.circle),
                        child: Center(
                          child: IconButton(
                            icon: Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                              size: size.width * .09,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * .03,
                      ),
                      Text(
                        widget.film.name,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: size.width * .06),
                      ),
                      SizedBox(
                        height: size.height * .03,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.film.year,
                            style: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.w300,
                                fontSize: size.width * .04),
                          ),
                          CustomVerticalDivider(),
                          Text(
                            widget.film.genre,
                            style: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.w300,
                                fontSize: size.width * .04),
                          ),
                          CustomVerticalDivider(),
                          Text(
                            "Sesons : ${widget.film.seasons.toString()}",
                            style: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.w300,
                                fontSize: size.width * .04),
                          )
                        ],
                      )
                    ],
                  ))),
          Positioned(
              left: 0,
              right: 0,
              top: 0,
              child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: size.width * .07, vertical: size.height * .07),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SeriesScreenImageButton(icon: Icons.arrow_back,function:()=>Navigator.pop(context)),
                    SeriesScreenImageButton(
                      icon: isFavorite?Icons.favorite:Icons.favorite_outline,
                      function:() {setState(() {
                        isFavorite=!isFavorite;
                      });}
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
