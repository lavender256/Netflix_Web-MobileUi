import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SearchFieldMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height*.09,
      padding: EdgeInsets.symmetric(horizontal:size.width*.04,vertical: size.height*.01),
      margin:EdgeInsets.symmetric(vertical: size.height*.04,),
      decoration: BoxDecoration(
        color: Colors.grey[900],
          borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        decoration: InputDecoration(
            hintStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500
            ),
            filled: true,
            fillColor: Colors.grey[900],
            hintText: "Search",
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,

        ),
      ),
    );
  }
}
