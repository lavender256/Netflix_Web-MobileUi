import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "Hello",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: size.width * .07)),
                TextSpan(
                    text: " Lavender!",
                    style: TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.w300,
                        fontSize: size.width * .07))
              ])),
              Text(
                "Check for latest addition.",
                style: TextStyle(
                    color: Colors.white70, fontSize: size.width * .04),
              )
            ],
          ),
          Container(
            width: size.height*.09,
            height:  size.height*.09,
            decoration: BoxDecoration(
          shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/dark2.jpg",
                ),fit: BoxFit.cover
              )
          ),)
        ],
      ),
    );
  }
}
