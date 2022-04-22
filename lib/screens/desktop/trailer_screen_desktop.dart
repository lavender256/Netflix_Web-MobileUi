import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fancy_drawer/fancy_drawer.dart';
import 'package:netflix/colors.dart';
import 'package:netflix/data/data.dart';
import 'package:netflix/models/film_model.dart';
import 'package:netflix/screens/desktop/watchlist_desktop.dart';
import 'package:netflix/screens/desktop/profile_screen_desktop.dart';
import 'package:netflix/widget/used/drawer_button.dart';
import 'package:netflix/widget/used/main_trailer_show.dart';
import 'package:netflix/widget/used/trailer_card.dart';
import 'home_screen_desktop.dart';
import 'library_screen_desktop.dart';

class TrailerScreenDesktop extends StatefulWidget {
  final String imageUrl;
  final String name;
  final String genre;
  final String year;

  TrailerScreenDesktop(
      {this.imageUrl = "https://i.postimg.cc/XJFXngnV/squid-game2.png",
      this.name = "Squid Game",
      this.genre = "Action, Scare",
      this.year = "2021"});

  @override
  _TrailerScreenDesktopState createState() => _TrailerScreenDesktopState();
}

class _TrailerScreenDesktopState extends State<TrailerScreenDesktop>
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
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Material(
      child: FancyDrawerWrapper(
        backgroundColor: Colors.black,
        controller: _controller,
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
              onTap: () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => LibraryScreenDesktop()))),
          DrawerButton(
              title: "Trailers",
              onTap: () => Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (_) => TrailerScreenDesktop()))),
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
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.black,
            title: Image.network("https://i.postimg.cc/VL59c331/netflix-logo1.png",width: size.width*.1,),
            centerTitle: true,
          ),
          body: Container(
              width: size.width,
              height: size.height,
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: size.width * .8,
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    MainTrailerShow(
                                      imageUrl: widget.imageUrl,
                                      name: widget.name,
                                      year: widget.year,
                                      genre: widget.genre,
                                    ),
                                    SizedBox(
                                      height: size.height * .02,
                                    ),
                                    Container(
                                      padding:
                                      EdgeInsets.only(left: size.width * .02),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Lastest Trailer",
                                            style: TextStyle(
                                                color: mainColorNetflix,
                                                fontWeight: FontWeight.w800,
                                                fontSize: size.width * .02),
                                          ),
                                          SizedBox(
                                            height: size.height * .03,
                                          ),
                                          Container(
                                            width: size.width,
                                            height: size.height * .38,
                                            child: ListView.builder(
                                                scrollDirection: Axis.horizontal,
                                                itemCount: newestList.length,
                                                itemBuilder: (BuildContext context,
                                                    int index) {
                                                  Film film = newestList[index];
                                                  return TrailerCard(
                                                      film: film, index: index);
                                                }),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                                left: size.width * .01,
                                top: size.height * .01,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.menu,
                                    color: Colors.white,
                                    size: size.width*.03,
                                  ),
                                  onPressed: () => _controller.toggle(),
                                ))
                          ],
                        ),
                        Container(
                          width: size.width*.2,
                          color: mainColorNetflix,
                          padding: EdgeInsets.symmetric(horizontal: size.width*.02,vertical: size.height*.02),
                          child:SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Now Playing(Box Office)",style: TextStyle(
                                    color: Colors.white,fontWeight: FontWeight.w800,fontSize: size.width*.014
                                ),),
                                SizedBox(
                                  height: size.height * .04,
                                ),
                                Container(
                                    height: size.height,
                                    width: size.width*.2,
                                    child: ListView.builder(
                                        itemCount: myListFilm.length,
                                        itemBuilder: (BuildContext context, int index) {
                                          Film film = myListFilm[index];
                                          return TrailerCard(
                                            film: film,
                                            index: index,
                                            isVertical: true,
                                          );
                                        }))
                              ],
                            ),
                          ) ,
                        )
                      ],
                    )
    ))));

  }
}
