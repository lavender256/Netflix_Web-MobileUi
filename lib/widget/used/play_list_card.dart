import 'package:flutter/material.dart';
import 'package:netflix/models/film_model.dart';
import 'package:netflix/screens/desktop/watchlist_desktop.dart';
import 'package:netflix/screens/mobile/watchlist_screen_mobile.dart';

import '../../colors.dart';
import '../../responsive.dart';

class PlayListCard extends StatefulWidget {
  final Film film;
  final int index;

  PlayListCard({this.film, this.index});

  @override
  _PlayListCardState createState() => _PlayListCardState();
}

class _PlayListCardState extends State<PlayListCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {},
      onHover: (val) {
        setState(() {
          isHover = val;
        });
      },
      child: isHover
          ? Container(
              margin: EdgeInsets.only(
                left: Responsive.isDesktop(context)?0:size.width*.04,
                  bottom: Responsive.isDesktop(context)
                      ? size.width * .04
                      : size.width * .02),
              height: size.height * .2,
              child: Stack(
                children: [
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(decoration: BoxDecoration(  color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                      padding: EdgeInsets.symmetric(
                          horizontal: Responsive.isDesktop(context)
                              ? size.width * .02
                              : size.width * .05),
                      height: Responsive.isDesktop(context)
                          ? size.height * .18
                          : size.height * .18,
                      width: Responsive.isDesktop(context)
                          ? size.width * .35
                          : size.width * .65,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            " ${widget.index + 1}.${widget.film.name}",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: Responsive.isDesktop(context)
                                    ? size.width * .01
                                    : size.width * .05),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Stack(
                                  children: [
                                    Container(
                                      width: Responsive.isDesktop(context)
                                          ? size.width * .22
                                          : size.width * .41,
                                      height: 3,
                                      color: Colors.grey,
                                    ),
                                    Container(
                                      width: Responsive.isDesktop(context)
                                          ? size.width * .17
                                          : size.width * .3,
                                      height: 3,
                                      color: mainColorNetflix,
                                    )
                                  ],
                                ),
                              ),
                              Text(
                                "${widget.film.remainTime}m left",
                                style: TextStyle(
                                    fontSize: Responsive.isDesktop(context)
                                        ? size.width * .008
                                        : size.width * .03,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>WatchListScreenDesktop(
                                  imageUrl: widget.film.imageUrl2,
                                  name:widget.film.name
                                )))
                                ,child: Container(
                                  width: Responsive.isDesktop(context)
                                      ? size.width * .05
                                      : size.width * .2,
                                  height: Responsive.isDesktop(context)
                                      ? size.height * .05
                                      : size.height * .05,
                                color: mainColorNetflix,
                                  child: Center(
                                    child: Text(
                                      "Continue",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              Responsive.isDesktop(context)?Text("27 August 2021",style: TextStyle(
                                color: Colors.black,fontSize: size.width*.008,fontWeight: FontWeight.bold
                              ),):SizedBox.shrink()
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      left: 0,
                      top: 0,
                      child: Container(

                        width: Responsive.isDesktop(context)
                            ? size.width * .11
                            : size.width * .31,
                        height: size.height * .18,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                            image: DecorationImage(
                                image: NetworkImage(widget.film.imageUrl1),
                                fit: BoxFit.cover)),
                      ))
                ],
              ),
            )
          : GestureDetector(
        onTap: ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>WatchListScreenMobile(
          imageUrl: widget.film.imageUrl2,
        ))),
            child: Container(
                margin: EdgeInsets.only(
                    top: Responsive.isDesktop(context)
                        ? size.width * .04
                        : size.width * .04,
                    right: Responsive.isDesktop(context) ? size.width * .03 : 0,
                    left: Responsive.isDesktop(context) ? size.width * .03 : size.width*.07),
                height: size.height * .2,
                child: Stack(
                  children: [
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(  decoration: BoxDecoration(  color: Color(0xff181818),
                        borderRadius: BorderRadius.circular(5)),
                        padding: EdgeInsets.symmetric(
                            horizontal: Responsive.isDesktop(context)
                                ? size.width * .02
                                : size.width * .05),
                        height: Responsive.isDesktop(context)
                            ? size.height * .18
                            : size.height * .18,
                        width: Responsive.isDesktop(context)
                            ? size.width * .3
                            : size.width * .65,

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              " ${widget.index + 1}.${widget.film.name}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Responsive.isDesktop(context)
                                      ? size.width * .01
                                      : size.width * .05),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: Responsive.isDesktop(context)
                                            ? size.width * .2
                                            : size.width * .41,
                                        height: 3,
                                        color: Colors.grey,
                                      ),
                                      Container(
                                        width: Responsive.isDesktop(context)
                                            ? size.width * .14
                                            : size.width * .3,
                                        height: 3,
                                        color: mainColorNetflix,
                                      )
                                    ],
                                  ),
                                ),
                                Text(
                                  "${widget.film.remainTime}m left",
                                  style: TextStyle(
                                      fontSize: Responsive.isDesktop(context)
                                          ? size.width * .008
                                          : size.width * .03,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Container(
                              width: Responsive.isDesktop(context)
                                  ? size.width * .05
                                  : size.width * .2,
                              height: Responsive.isDesktop(context)
                                  ? size.height * .05
                                  : size.height * .05,
                              color: mainColorNetflix,
                              child: Center(
                                child: Text(
                                  "Continue",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: Responsive.isDesktop(context)
                              ? size.width * .1
                              : size.width * .3,
                          height: size.height * .18,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                  image: NetworkImage(widget.film.imageUrl1),
                                  fit: BoxFit.cover)),
                        ))
                  ],
                ),
              ),
          ),
    );
  }
}
