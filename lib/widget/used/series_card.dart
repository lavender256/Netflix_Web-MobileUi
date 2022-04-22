import 'package:flutter/material.dart';
import 'package:netflix/colors.dart';
import 'package:netflix/models/film_model.dart';
import 'package:netflix/screens/desktop/home_screen_desktop.dart';
import 'package:netflix/screens/mobile/series_screen_mobile.dart';

import '../../responsive.dart';

class SeriesCard extends StatefulWidget {
  final Film film;
  final bool addToList;
  final bool isVertical;

  SeriesCard({this.film, this.addToList = false, this.isVertical = false});

  @override
  _SeriesCardState createState() => _SeriesCardState();
}

class _SeriesCardState extends State<SeriesCard> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () =>Responsive.isMobile(context)?Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) =>
                   SeriesScreenMobile(
                      film: widget.film,
                    )
                 )):Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>HomeScreenDesktop(name: widget.film.name,imageUrl: widget.film.imageUrl2,))),
      child: Container(
          margin:
              EdgeInsets.only(right: widget.isVertical ? 0 : size.width * .06),
          width:
              Responsive.isMobile(context) ? size.width * .6 : size.width * .17,
          height: widget.isVertical ? size.height * .32 : size.height,
          decoration: BoxDecoration(
              color: Colors.red,
              image: DecorationImage(
                  image: NetworkImage(widget.isVertical
                      ? widget.film.imageUrl2
                      : widget.film.imageUrl1),
                  fit: BoxFit.cover)),
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: Responsive.isMobile(context)
                          ? size.width * .02
                          : size.width * .01,
                      vertical: size.height * .01),
                  width: size.width,
                  height: size.height * .18,
                  color: Colors.black.withOpacity(.7),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.film.name,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: Responsive.isMobile(context)
                                ? size.width * .04
                                : size.width * .009),
                      ),
                      Text(
                        "Seasons : ${widget.film.seasons.toString()}",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: Responsive.isMobile(context)
                                ? size.width * .04
                                : size.width * .008,
                            fontWeight: FontWeight.w400),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.film.genre,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: Responsive.isMobile(context)
                                    ? size.width * .04
                                    : size.width * .008,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              widget.addToList
                  ? Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: Responsive.isMobile(context)
                            ? size.width * .12
                            : size.width * .035,
                        height: Responsive.isMobile(context)
                            ? size.width * .1
                            : size.width * .029,
                        color: mainColorNetflix,
                        child: Center(
                          child: Text(
                            "Add",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                      ))
                  : SizedBox.shrink()
            ],
          )),
    );
  }
}
