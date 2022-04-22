import 'package:flutter/material.dart';

import 'filter_card.dart';

class Filters extends StatefulWidget {
  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height*.17,
      child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Filters",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: size.width*.05
            ),
          ),
          Container(
            width: size.width,
            child: SingleChildScrollView(
              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FilterCard(title: "Genre",icon:Icons.dashboard,),
                  FilterCard(title: "Top IMDB",icon:Icons.star,),
                  FilterCard(title: "Language",icon:Icons.language,),
                  FilterCard(title: "Watched",icon:Icons.gamepad,)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
