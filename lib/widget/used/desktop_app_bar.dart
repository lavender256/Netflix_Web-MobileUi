import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:netflix/widget/used/search_field_desktop.dart';

import '../../colors.dart';


class DesktopAppBar extends StatefulWidget {
  @override
  _DesktopAppBarState createState() => _DesktopAppBarState();
}

var language = [
  'English',
  'Spaniol',
  'فارسی',
];

class _DesktopAppBarState extends State<DesktopAppBar> {
  String buttonSelectVal;
  bool isAlarmed = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: Colors.black.withOpacity(.5),
      padding: EdgeInsets.symmetric(
          horizontal: size.width * .05, vertical: size.height * .01),
      height: size.height * .09,
      child: Row(
        children: [
          Image.network(
            "https://i.postimg.cc/VL59c331/netflix-logo1.png",
            width: size.width * .1,
            height: size.height * .1,
          ),
          SearchFieldDesktop(),
          Spacer(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: size.width * .005),
            height: size.height * .055,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 1),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                dropdownColor: Colors.black,
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                ),
                value: buttonSelectVal,
                hint: Text(
                  "Language",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
                onChanged: (String newValue) {
                  setState(() {
                    buttonSelectVal = newValue;
                  });
                },
                items: language.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(
                      items,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          SizedBox(
            width: size.width * .02,
          ),
          IconButton(
            icon: Icon(
              !isAlarmed ? MdiIcons.bellOutline : MdiIcons.bellRing,
              color: mainColorNetflix,
            ),
            onPressed: () {
              setState(() {
                isAlarmed = !isAlarmed;
              });
            },
          ),
          SizedBox(
            width: size.width * .01,
          ),
          Container(
            width: size.width * .026,
            height: size.width * .026,
            decoration: BoxDecoration(
              color: Colors.red,
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: NetworkImage("https://i.postimg.cc/Y9cD4pB1/IMG-20210403-172119-957.jpg"),
                    fit: BoxFit.cover)),
          )
        ],
      ),
    );
  }
}
