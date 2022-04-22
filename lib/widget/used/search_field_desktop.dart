import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
class SearchFieldDesktop extends StatelessWidget {

  @override
  Widget build(BuildContext context) { var size=MediaQuery.of(context).size;
    return Container(margin: EdgeInsets.only(left: size.width*.02,top: size.width*.001,bottom:size.width*.001 ),
      width: size.width*.2,
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(color: Colors.white24,width: 1),
        borderRadius: BorderRadius.circular(20)
      ),
      child: TextField( style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          filled: true,
          focusColor: Colors.black,
          hintText: "I,m searching for...",hintStyle: TextStyle(
          color: Colors.white,fontWeight: FontWeight.w600,fontSize: size.width*.007
        ),
          prefixIcon: Icon(Icons.search,color: Colors.white,),
          suffixIcon: Icon(MdiIcons.filterMenu,color: Colors.white,size: size.width*.01,),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
            ),
          enabledBorder: InputBorder.none
        ),

      ),
    );
  }
}
