import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/screens/desktop/trailer_screen_desktop.dart';
import 'package:netflix/screens/splash_screen.dart';

import '../responsive.dart';
import 'desktop/home_screen_desktop.dart';
import 'mobile/home_screen_mobile.dart';



class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      desktop: HomeScreenDesktop(),
      mobile: SplashScreen(),
    );
  }
}
