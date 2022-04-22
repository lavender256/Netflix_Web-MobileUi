import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:netflix/colors.dart';
import 'package:netflix/data/data.dart';
import 'package:netflix/models/film_model.dart';
import 'package:netflix/widget/used/library_card.dart';
import 'package:netflix/widget/used/search_field_mobile.dart';

class LibraryScreenMobileSeeAll extends StatefulWidget {
  final String title;
  final String title2;

  LibraryScreenMobileSeeAll({this.title, this.title2});

  @override
  _LibraryScreenMobileSeeAllState createState() =>
      _LibraryScreenMobileSeeAllState();
}

class _LibraryScreenMobileSeeAllState extends State<LibraryScreenMobileSeeAll> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black,
          title: Image.network(
            "https://i.postimg.cc/VL59c331/netflix-logo1.png",
            width: size.width * .3,),
          centerTitle: true,
        ),
        backgroundColor: Colors.black,
        body: Container(
          width: size.width,
          height: size.height,
          padding: EdgeInsets.symmetric(horizontal: size.width * .04),
          child: CustomScrollView(slivers: [
            SliverToBoxAdapter(child: SearchFieldMobile()),
            SliverToBoxAdapter(
              child: Container(
                height: size.height*.1,
                child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: widget.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: mainColorNetflix,
                              fontSize: size.width * .05)),
                      TextSpan(
                          text: widget.title2,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              fontSize: size.width * .05))
                    ])),
              ),
            ),
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                  mainAxisSpacing: size.height * .05,
                  crossAxisSpacing: size.width * .06
              ),
              delegate: SliverChildBuilderDelegate(
                  (BuildContext context,int index){
                    Film film=newestList[index];
                    return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: Duration(milliseconds: 500),
                        child: ScaleAnimation(
                        duration: Duration(milliseconds: 900),
                    curve: Curves.fastLinearToSlowEaseIn,
                    child: FadeInAnimation(child: LibraryCard(film: film))));
                  },
                childCount: newestList.length,

              ),
            )
          ],
          ),
        )
    );
  }
}

/* Container(
                height: size.height * 1,
                child: AnimationLimiter(
                  child: GridView.builder(
                      physics: BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * .02),
                      gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: .78,
                          mainAxisSpacing: size.height * .05,
                          crossAxisSpacing: size.width * .03),
                      itemCount: newestList.length,
                      itemBuilder: (BuildContext context, int index) {
                        Film film = newestList[index];
                        return AnimationConfiguration.staggeredList(
                            position: index,
                            duration: Duration(milliseconds: 500),
                            child: ScaleAnimation(
                                duration: Duration(milliseconds: 900),
                                curve: Curves.fastLinearToSlowEaseIn,
                                child: FadeInAnimation(
                                    child: LibraryCard(film: film))));
                      }),
                )),*/