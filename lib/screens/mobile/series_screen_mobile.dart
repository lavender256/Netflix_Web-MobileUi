import 'package:flutter/material.dart';
import 'package:netflix/data/data.dart';
import 'package:netflix/data/episode.dart';
import 'package:netflix/models/episode_model.dart';
import 'package:netflix/models/film_model.dart';
import 'package:netflix/widget/used/episode_card.dart';
import 'package:netflix/widget/used/rich_text_with_see_all.dart';
import 'package:netflix/widget/used/series_screen_desc.dart';
import 'package:netflix/widget/used/series_screen_image.dart';


class SeriesScreenMobile extends StatefulWidget {
  final Film film;

  SeriesScreenMobile({this.film});

  @override
  _SeriesScreenMobileState createState() => _SeriesScreenMobileState();
}

class _SeriesScreenMobileState extends State<SeriesScreenMobile> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          child: SingleChildScrollView(   physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SeriesScreenImage(
                      film: widget.film,
                    ),
                    SizedBox(
                      height: size.height * .02,
                    ),
                   Container(
                       padding: EdgeInsets.symmetric(horizontal: size.width*.04),
                       child: RichTextWithSeeAll(title1: "Episode",title2: "Series",)),
                    SizedBox(
                      height: size.height * .02,
                    ),
                   Container(
                     width: size.width,
                     height: size.height*.2,
                     child: ListView.builder(
                       scrollDirection: Axis.horizontal,
                         itemCount: episodeList.length,
                         itemBuilder: (BuildContext context,int index){
                         Episode episode=episodeList[index];
                       return EpisodeCard(index:index,episode: episode,);
                     }),
                   ),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    SeriesScreenDesc(film:widget.film),
                  ])),
        ));
  }
}
