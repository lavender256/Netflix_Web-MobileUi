import 'package:flutter/material.dart';

class SeriesScreenImageButton extends StatelessWidget {

  final IconData icon;
  final Function function;

  SeriesScreenImageButton({this.icon,this.function});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * .08,
      width: size.height * .08,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(.4),
          borderRadius: BorderRadius.circular(15)),
      child: Center(
        child: IconButton(icon:Icon(
          icon,
          color: Colors.white,
          size: size.width * .07,
        ),
        onPressed: function,
        ),
      ),
    );
  }
}
