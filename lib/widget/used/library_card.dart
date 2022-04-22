import 'package:flutter/material.dart';
import 'package:netflix/models/film_model.dart';
import 'package:netflix/screens/desktop/library_screen_desktop.dart';

import '../../colors.dart';
import '../../responsive.dart';

class LibraryCard extends StatefulWidget {
  final Film film;

  LibraryCard({this.film});

  @override
  _LibraryCardState createState() => _LibraryCardState();
}

class _LibraryCardState extends State<LibraryCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (_) => LibraryScreenDesktop(
                    imageUrl: widget.film.imageUrl2,
                    name: widget.film.name,
                    year: widget.film.year,
                    genre: widget.film.genre,
                  ))),
      onHover: (val) {
        setState(() {
          isHover = val;
        });
      },
      child: isHover
          ? Stack(children: [
              Container(
                decoration: BoxDecoration(color: Colors.blue,
                    image: DecorationImage(
                        image: NetworkImage(widget.film.imageUrl1),
                        fit: BoxFit.cover)),
              ),
              Container(
                  color: mainColorNetflix.withOpacity(.7),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.play_circle_outline_outlined,
                          size: size.width * .03,
                          color: Colors.white,
                        ),
                        Text(
                          "Play now",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "Add To WatchList",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "Add To YourList",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  )),
            ])
          : Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.film.imageUrl1),
                      fit: BoxFit.cover)),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal:
                    Responsive.isMobile(context)
                        ? size.width * .02
                        : size.width * .01,
                    vertical: size.height * .01),
                width: size.width,
                height: size.height*.1,
                color: Colors.black.withOpacity(.7),
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.film.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: Responsive.isMobile(
                              context)
                              ? size.width * .04
                              : size.width * .009),
                    ),
                    Text(
                      "Seasons : ${widget.film.seasons.toString()}",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: Responsive.isMobile(
                              context)
                              ? size.width * .04
                              : size.width * .008,
                          fontWeight: FontWeight.w400),
                    ),
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment
                          .spaceBetween,
                      children: [
                        Text(
                          widget.film.genre,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: Responsive
                                  .isMobile(context)
                                  ? size.width * .04
                                  : size.width * .008,
                              fontWeight:
                              FontWeight.w400),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
            ),
    );
  }
}
