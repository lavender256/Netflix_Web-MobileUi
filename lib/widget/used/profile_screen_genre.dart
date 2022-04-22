import 'package:flutter/material.dart';
import 'package:netflix/responsive.dart';

import 'genre_card.dart';

class ProfileScreenGenre extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * .04),
      width: Responsive.isDesktop(context)?size.width * .32:size.width,
      height: Responsive.isDesktop(context)?size.height * .35:size.height*.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Favorite Genres",
            style: TextStyle(
                color: Colors.white,
                fontSize: Responsive.isDesktop(context)?size.width * .019:size.width*.05,
                fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GenreCard(
                title: "Action",
                color: Colors.blue,
              ),
              GenreCard(
                title: "Western",
                color: Colors.red,
              ),
              GenreCard(
                title: "Activentures",
                color: Colors.grey,
              ),
            ],
          ),
          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GenreCard(
                title: "Drama",
                color: Colors.orange,
              ),
              GenreCard(
                title: "Sci _ Fi",
                color: Colors.green,
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.add_circle_outline,
                color: Colors.grey,
              ),
              SizedBox(
                width: size.width * .005,
              ),
              Text(
                "Add Your favorite genres",
                style: TextStyle(color: Colors.white,
                  fontSize: Responsive.isDesktop(context)?size.width * .019:size.width*.05
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [
              GenreCard(
                title: "Crime",
                color: Colors.white10,
              ),
              GenreCard(
                title: "Comedy",
                color: Colors.white10,
              ),
              GenreCard(
                title: "Thriler",
                color: Colors.white10,
              )
            ],
          )
        ],
      ),
    );
  }
}
