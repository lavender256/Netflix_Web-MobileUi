import 'package:flutter/material.dart';
import 'package:netflix/models/episode_model.dart';

import '../../responsive.dart';

class EpisodeCard extends StatelessWidget {
  final int index;
final Episode episode;

  EpisodeCard({this.index,this.episode});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return Container(
      margin: EdgeInsets.only(left: size.width*.04),
      width: size.width * .3,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(episode.imageUrl),fit: BoxFit.cover
        )
      ),
      child: Container(color: Colors.black.withOpacity(.5),
        width: size.width,
        height: size.height,
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Episode ${index + 1}",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            IconButton(
                icon: Icon(
                  Icons.play_arrow,
                  color: Colors.white54,
                  size: Responsive.isDesktop(context)?size.width * .03:size.width*.09,
                ))
          ],
        ),
      ),
    );
  }
}
