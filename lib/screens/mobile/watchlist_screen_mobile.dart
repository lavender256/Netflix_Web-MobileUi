import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/data/data.dart';
import 'package:netflix/models/film_model.dart';
import 'package:netflix/widget/used/play_list_card.dart';

import '../nav_screen.dart';


class WatchListScreenMobile extends StatefulWidget {
  final String imageUrl;

  WatchListScreenMobile({this.imageUrl = "https://i.postimg.cc/3N8hzjRf/visavis2.jpg"});

  @override
  _WatchListScreenMobileState createState() => _WatchListScreenMobileState();
}

class _WatchListScreenMobileState extends State<WatchListScreenMobile> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: size.width,
        height: size.height,
        child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  height: size.height * .4,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(widget.imageUrl))),
                  child: Stack(
                    children: [
                      Center(
                        child: Container(
                          width: size.width * .25,
                          height: size.width * .25,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(.5),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                              size: size.width * .15,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                          left: size.width * .03,
                          top: size.height * .03,
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                            onPressed: () => Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (_) => NavScreen())),
                          ))
                    ],
                  ),
                ),
              ),
             
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: size.width * .04,vertical: size.height*.02),
                  child: Text(
                    "Recently Watch",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: size.width * .05),
                  ),
                ),
              ),
               SliverList(
                    delegate:SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                      Film film = featuredSeries[index];
                      return PlayListCard(
                        film: film,
                        index: index,
                      );
                    },childCount: featuredSeries.length)),
            ],
          ),
        ),
    );
  }
}
