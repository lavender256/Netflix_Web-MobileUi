import 'package:fancy_drawer/fancy_drawer.dart';
import 'package:flutter/material.dart';
import 'package:netflix/data/data.dart';
import 'package:netflix/models/film_model.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:netflix/screens/desktop/watchlist_desktop.dart';
import 'package:netflix/screens/desktop/profile_screen_desktop.dart';
import 'package:netflix/screens/desktop/trailer_screen_desktop.dart';
import 'package:netflix/widget/used/drawer_button.dart';
import 'package:netflix/widget/used/library_card.dart';
import '../../colors.dart';
import '../../responsive.dart';
import 'home_screen_desktop.dart';


class LibraryScreenDesktop extends StatefulWidget {
  final String imageUrl;
  final String name;
  final String genre;
  final String year;

  LibraryScreenDesktop(
      {this.imageUrl = "https://i.postimg.cc/fRB9P5Rp/sense82.jpg",
      this.name = "Sense 8",
      this.genre = "Action",
      this.year = "2022"});

  @override
  _LibraryScreenDesktopState createState() => _LibraryScreenDesktopState();
}

class _LibraryScreenDesktopState extends State<LibraryScreenDesktop> with SingleTickerProviderStateMixin{

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
    ],child:Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.black,
              title: Image.network("https://i.postimg.cc/VL59c331/netflix-logo1.png",width: size.width*.1,),
              centerTitle: true,
            ),
        backgroundColor: Colors.black,
        body: Container(
            width: size.width,
            height: size.height,
            child: SingleChildScrollView(
              child: Column(children: [
                Row(
                  children: [
                    Container(
                      width: Responsive.isDesktop(context)?size.width * .7:size.width*.8,
                      height: size.height * .5,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(widget.imageUrl),
                              fit: BoxFit.cover)),
                      child: Stack(
                        children: [
                          Positioned(
                              left: size.width * .01,
                              top: size.height * .01,
                              child: IconButton(
                                icon: Icon(Icons.menu,size: size.width*.03,color: Colors.white,),
                                onPressed: () => _controller.toggle(),
                              )),
                          Positioned(
                              bottom: 0,
                              child: Container(
                                padding: EdgeInsets.only(left: size.width*.03),
                                height: size.height * .09,
                                width: size.width,
                                color: Colors.black.withOpacity(.8),
                                child: Text(
                                  widget.name,
                                  style: TextStyle(
                                    fontSize: size.width*.025,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ))
                        ],
                      ),
                    ),
                    Container(
                      width: size.width * .3,
                      height: size.height * .5,
                      padding: EdgeInsets.symmetric(
                          horizontal: size.width * .02,
                          vertical: size.height * .015),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.name,
                            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: size.width*.03),
                          ),
                          SizedBox(
                            height: size.width * .02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.genre,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                widget.year,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                          SizedBox(
                            height: size.width * .03,
                          ),
                          Text(
                            'A lonely young woman, Sintel, helps and befriends a dragon,\nwhom she calls Scales. But when he is kidnapped by an adult\n'
                            'dragon, Sintel decides to embark on a dangerous quest to find\n'
                            'her lost friend Scales.',
                            style: TextStyle(
                                color: textInfoColorNetflix,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.1),
                          ),


                        ],
                      ),
                    )
                  ],
                ),
                Container(
                    height: size.height * 1,
                    child: AnimationLimiter(
                      child: GridView.builder(
                          physics: BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * .02),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: Responsive.isDesktop(context)?6:2, childAspectRatio: .78),
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
                    )),
              ]),
            )))));
  }
}
