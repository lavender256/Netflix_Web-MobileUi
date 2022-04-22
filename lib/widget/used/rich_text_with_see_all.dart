import 'package:flutter/material.dart';
import 'package:netflix/responsive.dart';
import 'package:netflix/screens/mobile/library_screen_mobile_see_all.dart';

import '../../colors.dart';

class RichTextWithSeeAll extends StatelessWidget {
final String title1,title2;

RichTextWithSeeAll({this.title1, this.title2});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return  Container(width: size.width,
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: '${title1} ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: Responsive.isMobile(context)?size.width * .06:size.width*.02)),

                TextSpan(
                    text: title2,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: mainColorNetflix,
                        fontSize: Responsive.isMobile(context)?size.width * .06:size.width*.02))
              ])),
          Spacer(),
          RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: "See ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: Responsive.isMobile(context)?size.width * .03:size.width*.011)),
                TextSpan(
                    text: "all",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.white54,
                        fontSize: Responsive.isMobile(context)?size.width * .03:size.width*.011))
              ])),
          IconButton(
              icon: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.white,
              ),
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => LibraryScreenMobileSeeAll(title: title1,title2: title2,))))
        ],
      ),
    );
  }
}
