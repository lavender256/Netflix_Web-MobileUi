import 'package:flutter/material.dart';

import '../../colors.dart';

class RadiusButton extends StatefulWidget {
  final String title;
  final IconData icon;
  final Color textColor;
  final Color color;


  RadiusButton({this.title, this.icon, this.textColor,this.color});

  @override
  _RadiusButtonState createState() => _RadiusButtonState();
}

class _RadiusButtonState extends State<RadiusButton> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;
    return AnimatedContainer(duration: Duration(milliseconds: 200),
      child: InkWell(
        onTap: (){},
        onHover: (val) {
          setState(() {
            isHover = val;
          });
        },
        child: isHover?Container(
          width: size.width * .11,
          height: size.height * .05,
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: textInfoColorNetflix, width: 2),
          ),
          child: Row(crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(widget.icon, size: size.width * .021, color: widget.textColor,),
              Text(widget.title, style: TextStyle(
                  color: textInfoColorNetflix, fontWeight: FontWeight.w600),)
            ],
          ),
        ): Container(
          width: size.width * .11,
          height: size.height * .05,
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: textInfoColorNetflix, width: 2),
          ),
          child: Row(crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(widget.icon, size: size.width * .021, color: widget.textColor,),
              Text(widget.title, style: TextStyle(
                  color: textInfoColorNetflix, fontWeight: FontWeight.w600),)
            ],
          ),
        )
      ),

    )
   ;
  }
}
