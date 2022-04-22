import 'package:fancy_drawer/fancy_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/data/data.dart';
import 'package:netflix/models/film_model.dart';
import 'package:netflix/screens/desktop/watchlist_desktop.dart';
import 'package:netflix/screens/desktop/profile_screen_desktop.dart';
import 'package:netflix/screens/desktop/trailer_screen_desktop.dart';
import 'package:netflix/widget/used/casts_slimy_card.dart';
import 'package:netflix/widget/used/desktop_app_bar.dart';
import 'package:netflix/widget/used/drawer_button.dart';
import 'package:netflix/widget/used/main_film_show.dart';
import 'package:netflix/widget/used/rich_text_with_see_all.dart';
import 'package:netflix/widget/used/series_card.dart';
import 'library_screen_desktop.dart';



class HomeScreenDesktop extends StatefulWidget {
  final String imageUrl;
  final String name;

  HomeScreenDesktop(
      {this.imageUrl = "https://i.postimg.cc/PqvtrZLq/money-heist3.jpg",
      this.name = "Lacasa De\nPapel"});

  @override
  _HomeScreenDesktopState createState() => _HomeScreenDesktopState();
}

class _HomeScreenDesktopState extends State<HomeScreenDesktop>
    with SingleTickerProviderStateMixin {
  FancyDrawerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = FancyDrawerController(
        vsync: this, duration: Duration(milliseconds: 250))
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Material(
      child: FancyDrawerWrapper(
        backgroundColor: Colors.black,
        controller: _controller,
        drawerPadding: EdgeInsets.symmetric(horizontal: 50),
        hideOnContentTap: true,
        drawerItems: [
          DrawerButton(
            title: "Home",
            onTap: () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (_) => HomeScreenDesktop())),
          ),
          DrawerButton(
              title: "WatchList",
              onTap: () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => WatchListScreenDesktop()))),
          DrawerButton(
              title: "Library",
              onTap: () =>
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(
                          builder: (_) => LibraryScreenDesktop()))),
          DrawerButton(
              title: "Trailers",
              onTap: () => Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => TrailerScreenDesktop()))),
          DrawerButton(
            title: "News",
            onTap: () => print("films"),
          ),
          DrawerButton(
            title: "Profile",
            onTap: () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (_) => ProfileScreenDesktop())),
          )
        ],

        child: Scaffold(
            backgroundColor: Colors.black,
            body: Container(
                width: size.width,
                height: size.height,
                child: SingleChildScrollView(
                  child: Column(children: [
                    Container(
                        child: Stack(
                      children: [
                        MainFilmShow(
                          imageUrl: widget.imageUrl,
                          name: widget.name,
                        ),
                        Positioned(
                            top: -size.height * .25,
                            right: size.width * .005,
                            child:CastSlimyCard() ),
                        Positioned(
                          left: 0,
                          right: 0,
                          top: 0,
                          child: DesktopAppBar(),
                        ),
                        Positioned(
                            left: size.width * .01,
                            top: size.height * .01,
                            child: IconButton(
                              icon: Icon(Icons.menu,size: size.width*.03,color: Colors.white,),
                              onPressed: () => _controller.toggle(),
                            )),
                      ],
                    )),
                    SizedBox(
                      height: size.width * .01,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: size.width*.02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichTextWithSeeAll(title1: "Featured",title2: "Series",),
                          SizedBox(
                            height: size.width * .01,
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
                            height: size.width * .01,
                          ),
                          RichTextWithSeeAll(title1: "My",title2: "List",),
                          SizedBox(
                            height: size.width * .01,
                          ),
                          Container(
                            width: size.width,
                            height: size.height*.5,
                            child: ListView.builder(
                                itemCount: newestList.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context,int index){
                                  Film film=newestList[index];
                                  return SeriesCard(film: film);
                                }),
                          ),
                          SizedBox(
                            height: size.width * .01,
                          ),
                          RichTextWithSeeAll(title1: "Newest",title2: "Series",),
                          SizedBox(
                            height: size.width * .01,
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
                          SizedBox(
                            height: size.width * .01,
                          ),
                        ],
                      ),
                    )

                  ]),
                ))),
      ),
    );
  }
}
