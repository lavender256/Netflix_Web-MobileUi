import 'package:flutter/material.dart';
import 'package:netflix/screens/mobile/watchlist_screen_mobile.dart';
import 'package:netflix/screens/mobile/trailer_screen_mobile.dart';
import '../colors.dart';
import '../responsive.dart';
import 'home_screen.dart';
import 'mobile/home_screen_mobile.dart';
import 'mobile/library_screen_mobile.dart';
import 'mobile/profile_screen_mobile.dart';


class NavScreen extends StatefulWidget {

  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  List<Widget> screens = [
    HomeScreenMobile(),
    WatchListScreenMobile(),
    LibraryScreenMobile(),
    TrailerScreenMobile(),
    ProfileScreenMobile()
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.black,
        bottomNavigationBar: Responsive.isMobile(context)
            ? BottomNavigationBar(
                elevation: 0,
                backgroundColor: Colors.black,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: mainColorNetflix,
                unselectedItemColor: Colors.white10,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: "Home"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.play_circle_outline_outlined), label: "Play List"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.video_library_sharp), label: "Library"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.track_changes), label: "Trailer"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.account_circle_outlined), label: "Profile"),
                ],
                currentIndex: selectedIndex,
                onTap: (int index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              )
            : null,
        body: screens.elementAt(selectedIndex));
  }
}
