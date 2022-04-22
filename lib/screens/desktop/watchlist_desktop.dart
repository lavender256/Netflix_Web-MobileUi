import 'package:fancy_drawer/fancy_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:netflix/data/data.dart';
import 'package:netflix/models/film_model.dart';
import 'package:netflix/screens/desktop/profile_screen_desktop.dart';
import 'package:netflix/screens/desktop/trailer_screen_desktop.dart';
import 'package:netflix/widget/used/drawer_button.dart';
import 'package:netflix/widget/used/play_list_card.dart';
import 'package:netflix/widget/used/slide_fade_transition.dart';
import 'package:netflix/widget/used/slide_fade_trasnsition.dart';
import '../../colors.dart';
import 'home_screen_desktop.dart';
import 'library_screen_desktop.dart';


class WatchListScreenDesktop extends StatefulWidget {
  final String imageUrl;
  final String name;

  WatchListScreenDesktop(
      {this.imageUrl = "https://i.postimg.cc/3N8hzjRf/visavis2.jpg", this.name = "Vis a Vis"});

  @override
  _WatchListScreenDesktopState createState() => _WatchListScreenDesktopState();
}

class _WatchListScreenDesktopState extends State<WatchListScreenDesktop> with SingleTickerProviderStateMixin {

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
    var size = MediaQuery
        .of(context)
        .size;
    return Material(
      child: FancyDrawerWrapper(
        backgroundColor: Colors.black,
        controller: _controller,
        drawerItems: [
          DrawerButton(
            title: "Home",
            onTap: () =>
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => HomeScreenDesktop())),
          ),
          DrawerButton(
              title: "WatchList",
              onTap: () =>
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(
                          builder: (_) => WatchListScreenDesktop()))),
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
            onTap: () =>
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => ProfileScreenDesktop())),
          )
        ],
        child: Scaffold(
            body: Container(
              width: size.width,
              height: size.height,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.imageUrl), fit: BoxFit.cover)),
                child: Stack(
                  children: [
                    Container(
                      width: size.width,
                      height: size.height,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.transparent,
                                Colors.black12,
                                Colors.black45,
                                Colors.black45,
                                Colors.black,
                                Colors.black,
                                Colors.black
                              ])),
                    ),
                    Positioned(
                        right: size.width * .06,
                        top: size.height * .08,
                        child: Container(
                          height: size.height,
                          width: size.width * .45,
                          child: AnimationLimiter(
                            child: ListView.builder(
                                physics: BouncingScrollPhysics(
                                    parent: AlwaysScrollableScrollPhysics()),
                                itemCount: featuredSeries.length,
                                itemBuilder: (BuildContext context, int index) {
                                  Film film = featuredSeries[index];
                                  return AnimationConfiguration.staggeredList(
                                    position: index,
                                    delay: Duration(milliseconds: 100),
                                    child: SlideAnimation(
                                      duration: Duration(milliseconds: 5500),
                                      curve: Curves.fastLinearToSlowEaseIn,
                                      horizontalOffset: 30,
                                      verticalOffset: 300,
                                      child: FlipAnimation(
                                        duration: Duration(milliseconds: 3000),
                                        curve: Curves.fastLinearToSlowEaseIn,
                                        flipAxis: FlipAxis.y,
                                        child: PlayListCard(
                                          film: film,
                                          index: index,
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        )),
                    Positioned(
                        bottom: 0,
                        left: 0,
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * .05,
                              vertical: size.height * .04),
                          width: size.width * .37,
                          height: size.width * .22,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MySlideFadeTransition(
                                child: Text(
                                  widget.name,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: size.width * .037),
                                ),
                              ),
                              MySlideFadeTransition(
                                child: Text(
                                  "S03 , E05",
                                  style: TextStyle(
                                      color: Colors.white70,
                                      fontWeight: FontWeight.w500,
                                      fontSize: size.width * .011),
                                ),
                              ),
                              MySlideFadeTransition(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    Container(
                                      child: Stack(
                                        children: [
                                          Container(
                                            width: size.width * .22,
                                            height: 3,
                                            color: Colors.grey,
                                          ),
                                          Container(
                                            width: size.width * .1,
                                            height: 3,
                                            color: mainColorNetflix,
                                          )
                                        ],
                                      ),
                                    ),
                                    Text(
                                      "12m left",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                              MySlideFadeTransition(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    Container(
                                      width: size.width * .11,
                                      height: size.height * .07,
                                      decoration: BoxDecoration(
                                          color: mainColorNetflix,
                                          borderRadius: BorderRadius.circular(
                                              15)),
                                      child: Center(
                                          child: Text(
                                            "Continue",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: size.width * .012),
                                          )),
                                    ),
                                    Container(
                                      width: size.width * .11,
                                      height: size.height * .07,
                                      decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius: BorderRadius.circular(
                                              15)),
                                      child: Center(
                                          child: Text(
                                            "WatchList",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500,
                                                fontSize: size.width * .012),
                                          )),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )),
                    Positioned(
                        left: size.width * .01,
                        top: size.height * .01,
                        child: IconButton(
                          icon: Icon(Icons.menu, color: Colors.white,size: size.width*.03,),
                          onPressed: () => _controller.toggle(),
                        ))
                  ],
                ),
              ),
            )
        ),
      ),
    );
  }
}
