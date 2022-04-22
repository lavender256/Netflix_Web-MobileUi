import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:netflix/colors.dart';
import 'package:netflix/data/data.dart';
import 'package:netflix/models/film_model.dart';
import 'package:netflix/widget/used/series_card.dart';

class TrailerTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                width: size.width,
                height: size.height*.1,
                child: Center(
                  child: Text("Lastest Trailer",style: TextStyle(
                    color: Colors.white,fontWeight: FontWeight.bold,fontSize: size.width*.05
                  ),),
                ),
              ),
            ),
            SliverList(
                delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
                  Film film=featuredSeries[index];
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    delay: Duration(milliseconds: 100),
                    child: SlideAnimation(
                        duration: Duration(milliseconds: 150),
                        curve: Curves.fastLinearToSlowEaseIn,
                        horizontalOffset: 30,
                        verticalOffset: 300,
                        child: FlipAnimation(
                            duration: Duration(milliseconds: 3000),
                            curve: Curves.fastLinearToSlowEaseIn,
                            flipAxis: FlipAxis.y,
                            child: GestureDetector(
                                child: SeriesCard(film: film,isVertical: true)
                            ))),

                  );
                }, childCount: featuredSeries.length))
          ],
        ));
  }
}
