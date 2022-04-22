import 'package:flutter/material.dart';
import 'package:netflix/data/data.dart';
import 'package:netflix/models/film_model.dart';
import 'package:netflix/widget/used/filters.dart';
import 'package:netflix/widget/used/profile_header.dart';
import 'package:netflix/widget/used/rich_text_with_see_all.dart';
import 'package:netflix/widget/used/search_field_mobile.dart';
import 'package:netflix/widget/used/series_card.dart';

import '../../colors.dart';
import 'library_screen_mobile_see_all.dart';


class HomeScreenMobile extends StatefulWidget {
  @override
  _HomeScreenMobileState createState() => _HomeScreenMobileState();
}

class _HomeScreenMobileState extends State<HomeScreenMobile> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: Image.network("https://i.postimg.cc/VL59c331/netflix-logo1.png",width: size.width*.3,),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Container(
        width: size.width,
        height: size.height,
        padding: EdgeInsets.symmetric(horizontal: size.width*.06),
        child: SingleChildScrollView(   physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileHeader(),
              SearchFieldMobile(),
              Filters(),
              SizedBox(
                height: size.height * .04,
              ),
              RichTextWithSeeAll(title1: "Featured",title2: "Series",),
              SizedBox(
                height: size.height * .02,
              ),
              Container(
                width: size.width,
                height: size.height*.5,
                child: ListView.builder(
                    itemCount: featuredSeries.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context,int index){
                      Film film=featuredSeries[index];
                  return SeriesCard(film: film,addToList: true);
                }),
              ),
              SizedBox(
                height: size.height * .04,
              ),
              RichTextWithSeeAll(title1: "My",title2: "List",),
              SizedBox(
                height: size.height * .02,
              ),
              Container(
                width: size.width,
                height: size.height*.5,
                child: ListView.builder(
                    itemCount: myListFilm.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context,int index){
                      Film film=myListFilm[index];
                      return SeriesCard(film: film);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
