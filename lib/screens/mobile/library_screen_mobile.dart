import 'package:flutter/material.dart';
import 'package:netflix/data/data.dart';
import 'package:netflix/models/film_model.dart';
import 'package:netflix/widget/used/rich_text_with_see_all.dart';
import 'package:netflix/widget/used/search_field_mobile.dart';
import 'package:netflix/widget/used/series_card.dart';

class LibraryScreenMobile extends StatefulWidget {
  final String imageUrl;
  final String name;
  final String genre;
  final String year;

  LibraryScreenMobile(
      {this.imageUrl = "https://i.postimg.cc/fRB9P5Rp/sense82.jpg",
      this.name = "Sense 8",
      this.genre = "Action",
      this.year = "2022"});

  @override
  _LibraryScreenMobileState createState() => _LibraryScreenMobileState();
}

class _LibraryScreenMobileState extends State<LibraryScreenMobile> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black,
          title: Image.network(
            "https://i.postimg.cc/VL59c331/netflix-logo1.png",
            width: size.width * .3,
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.black,
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: size.width * .05),
            width: size.width,
            height: size.height,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(children: [
                SearchFieldMobile(),
                RichTextWithSeeAll(
                  title1: "Recommend ",
                  title2: "For You",
                ),
                Container(
                  height: size.height*.45,
                  width: size.width,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: newestList.length,
                      itemBuilder: (BuildContext context,int  index){
                    Film film=newestList[index];
                    return SeriesCard(film: film);
                  }),
                ),
                SizedBox(
                  height: size.height * .04,
                ),
                RichTextWithSeeAll(
                  title1: "Popular ",
                  title2: "Series",
                ),
                Container(
                  height: size.height*.45,
                  width: size.width,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: myListFilm.length,
                      itemBuilder: (BuildContext context,int  index){
                        Film film=myListFilm[index];
                        return SeriesCard(film: film);
                      }),
                ),
                SizedBox(
                  height: size.height * .04,
                ),
                RichTextWithSeeAll(
                  title1: "Comming ",
                  title2: "Soon",
                ),
                Container(
                  height: size.height*.45,
                  width: size.width,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: featuredSeries.length,
                      itemBuilder: (BuildContext context,int  index){
                        Film film=featuredSeries[index];
                        return SeriesCard(film: film,);
                      }),
                ),
                SizedBox(
                  height: size.height * .04,
                ),
                RichTextWithSeeAll(
                  title1: "Top Rated ",
                  title2: "Series",
                ),
                Container(
                  height: size.height*.45,
                  width: size.width,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: newestList.length,
                      itemBuilder: (BuildContext context,int  index){
                        Film film=newestList[index];
                        return SeriesCard(film: film);
                      }),
                ),
                SizedBox(
                  height: size.height * .02,
                ),

              ]),
            )));
  }
}

/*  ,*/
