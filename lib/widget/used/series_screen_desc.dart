import 'package:flutter/material.dart';
import 'package:netflix/models/film_model.dart';


class SeriesScreenDesc extends StatelessWidget {
  final Film film;

  SeriesScreenDesc({this.film});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.width * .06),
      height: size.height * .3,
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Pilot",
            style: TextStyle(
              fontSize: size.width * .07,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: size.height * .02,
          ),
          Text(film.description,style: TextStyle(color: Colors.white,fontSize: size.width*.05,fontWeight: FontWeight.w500),)
        ],
      ),
    );
  }
}
