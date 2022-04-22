import 'package:flutter/material.dart';
import 'package:netflix/widget/used/slide_fade_trasnsition.dart';

class MySlideFadeTransition extends StatelessWidget {
final Widget child;

MySlideFadeTransition({this.child});

@override
  Widget build(BuildContext context) {
    return SlideFadeTransition(
      curve: Curves.elasticOut,
      delayStart: Duration(milliseconds: 500),
      animationDuration: Duration(milliseconds: 1200),
      offset: 2.5,
      direction: Direction.horizontal,
      child: child,
    );
  }
}
