import 'package:flutter/material.dart';
import 'package:netflix/data/data.dart';
import 'package:netflix/models/film_model.dart';
import 'package:slimy_card/slimy_card.dart';

import '../../colors.dart';

class CastSlimyCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SlimyCard(
      slimeEnabled: false,
      width: size.width * .2,
      color: Colors.transparent,
      bottomCardHeight: size.width * .5,
      topCardWidget: Container(
        width: size.width * .1,
        height: size.height * .1,
      ),
      bottomCardWidget: Container(
        width: size.width * .1,
        child: ListView.builder(
            itemCount: 5,
            itemBuilder:
                (BuildContext context, int index) {
              Film film = myListFilm[index];
              return Container(
                margin: EdgeInsets.only(
                    bottom: size.height * .007),
                width: size.width * .055,
                height: size.width * .055,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: mainColorNetflix, width: 3),
                    image: DecorationImage(
                        image:
                        NetworkImage(film.imageUrl1),
                        fit: BoxFit.cover)),
              );
            }),
      ),
    );
  }
}
