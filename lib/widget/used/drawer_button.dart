import 'package:flutter/material.dart';

import '../../colors.dart';

class DrawerButton extends StatefulWidget {
  final String title;
  final Function onTap;

  DrawerButton({this.title, this.onTap});

  @override
  _DrawerButtonState createState() => _DrawerButtonState();
}

class _DrawerButtonState extends State<DrawerButton> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return InkWell(
        onTap: widget.onTap,
        onHover: (val) {
          setState(() {
            isHover = val;
          });
        },
        child: isHover
            ? Container(   height: size.height * .05,
          width: size.width * .1,

                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Colors.grey.withOpacity(.5),
                  Colors.grey[900],
                  Colors.black
                ])),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 30),
                      height: size.height * .05,
                      width: 3,
                      color: mainColorNetflix,
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Container( padding: EdgeInsets.symmetric(vertical: 10),
                      width: size.width * .1,
                      child: Text(
                        widget.title,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              )
            : Container(
                height: size.height * .05,
                width: size.width * .1,
                color: Colors.transparent,
                child: Row(
                  children: [
                    SizedBox(
                      width: 50,
                    ),
                    Text(
                      widget.title,
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ],
                )));
  }
}
/**/
