import 'package:flutter/material.dart';

class FilterCard extends StatelessWidget {
final String title;
final IconData icon;

FilterCard({this.title, this.icon});

  @override
  Widget build(BuildContext context) {var size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          Container(
            height: size.width*.16,
            width: size.width*.16,
            decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white60
          ),
          child: Icon(icon,color: Colors.white,size: size.width*.08,),
          ),
          SizedBox(height: size.height*.01,),
          Text(title,style: TextStyle(color: Colors.white),)
        ],
      ),
    );
  }
}
