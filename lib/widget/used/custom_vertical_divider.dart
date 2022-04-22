import 'package:flutter/material.dart';

class CustomVerticalDivider extends StatelessWidget {

  @override
  Widget build(BuildContext context) { var size = MediaQuery.of(context).size;
    return Container(
      height: size.height*.02,
      width: 1,
      color: Colors.white70,
    );
  }
}
