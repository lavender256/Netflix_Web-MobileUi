import 'package:fancy_drawer/fancy_drawer.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:netflix/screens/desktop/watchlist_desktop.dart';
import 'package:netflix/screens/desktop/trailer_screen_desktop.dart';
import 'package:netflix/widget/used/drawer_button.dart';
import 'package:netflix/widget/used/genre_card.dart';
import 'package:netflix/widget/used/profile_screen_genre.dart';
import '../../colors.dart';
import 'home_screen_desktop.dart';
import 'library_screen_desktop.dart';
class ProfileScreenDesktop extends StatefulWidget {
  @override
  _ProfileScreenDesktopState createState() => _ProfileScreenDesktopState();
}

class _ProfileScreenDesktopState extends State<ProfileScreenDesktop>
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
        drawerItems: [ DrawerButton(
          title: "Home",
          onTap: () =>Navigator.pushReplacement(context,MaterialPageRoute(builder: (_)=>HomeScreenDesktop())) ,
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
            onTap: () => Navigator.pushReplacement(context,MaterialPageRoute(builder: (_)=>ProfileScreenDesktop())) ,
          )],
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Container(
              width: size.width,
              height: size.height,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: size.height * .6,
                      width: size.width,
                      color: Colors.black,
                      child: Stack(
                        children: [
                          Positioned(
                            top: 0,
                            child: Container(
                              height: size.height * .4,
                              width: size.width,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          "https://i.postimg.cc/rpGxJctG/netflix-logo2.jpg"),
                                      fit: BoxFit.cover)),
                            ),
                          ),
                          Positioned(
                              left: size.width * .1,
                              bottom: size.height * .05,
                              child: Container(
                                height: size.height * .3,
                                child: Stack(children: [
                                  Positioned(
                                    child: Container(
                                        padding:
                                            EdgeInsets.all(size.width * .003),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: mainColorNetflix),
                                        child: Container(
                                          width: size.width * .15,
                                          height: size.width * .15,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      "https://i.postimg.cc/Y9cD4pB1/IMG-20210403-172119-957.jpg"),
                                                  fit: BoxFit.cover)),
                                        )),
                                  ),
                                  Positioned(
                                      right: size.width * .009,
                                      bottom: size.width * .009,
                                      child: Container(
                                        width: size.width * .029,
                                        height: size.width * .029,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.white),
                                        child: Center(
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.camera_alt,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ))
                                ]),
                              )),
                          Positioned(
                              bottom: 0,
                              right: 0,
                              left: size.width * .28,
                              child: Container(
                                  color: Colors.black,
                                  width: size.width * .4,
                                  height: size.width * .1,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "Lavender",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: size.width * .02),
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Gmail :",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize:
                                                      size.width * .012),
                                            ),
                                            SizedBox(
                                              width: size.width * .005,
                                            ),
                                            Text(
                                              "Snchly9890@gmail.com",
                                              style: TextStyle(
                                                  color: mainColorNetflix,
                                                  fontWeight: FontWeight.w800,
                                                  fontSize:
                                                      size.width * .012),
                                            ),
                                            SizedBox(
                                              width: size.width * .005,
                                            ),
                                            Icon(
                                              MdiIcons.checkDecagram,
                                              color: Colors.blue,
                                            ),
                                          ],
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Mobile :",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize:
                                                      size.width * .012),
                                            ),
                                            SizedBox(
                                              width: size.width * .005,
                                            ),
                                            Text(
                                              "+989331779890",
                                              style: TextStyle(
                                                  color: mainColorNetflix,
                                                  fontWeight: FontWeight.w800,
                                                  fontSize:
                                                      size.width * .012),
                                            ),
                                            SizedBox(
                                              width: size.width * .005,
                                            ),
                                            Icon(
                                              MdiIcons.checkDecagram,
                                              color: Colors.blue,
                                            ),
                                          ],
                                        ),
                                      ]))),
                          Positioned(
                              left: size.width * .01,
                              top: size.height * .01,
                              child: IconButton(
                                icon: Icon(Icons.menu,color: Colors.white,size: size.width*.03,),
                                onPressed: () => _controller.toggle(),
                              ))
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ProfileScreenGenre(),
                        Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * .05),
                          width: size.width * .35,
                          height: size.height * .3,
                          color: mainColorNetflix,
                        )
                      ],
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
