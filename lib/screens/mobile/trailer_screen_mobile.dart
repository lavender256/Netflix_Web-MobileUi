import 'package:flutter/material.dart';
import 'package:netflix/colors.dart';
import 'package:netflix/widget/used/box_office_tab.dart';
import 'package:netflix/widget/used/trailer_tab.dart';

class TrailerScreenMobile extends StatefulWidget {
  @override
  _TrailerScreenMobileState createState() => _TrailerScreenMobileState();
}


class _TrailerScreenMobileState extends State<TrailerScreenMobile> with SingleTickerProviderStateMixin{
  TabController tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController=TabController(length: 2, vsync: this,initialIndex: 0);
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: Image.network(
          "https://i.postimg.cc/VL59c331/netflix-logo1.png",
          width: size.width * .3,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: size.height*.02,),
            Container(
              width: size.width,
              height: size.height * .1,
              child: TabBar(
                indicatorColor: mainColorNetflix,
                labelColor: mainColorNetflix,
                unselectedLabelColor: Colors.white38,
                controller: tabController,
                tabs: [
                  Text("Trailer"),
                  Text("BoxOffice")
                ],
              ),
            ),
            Container(
              width: size.width,
              height: size.height*.7,
              child: TabBarView(
                controller: tabController,
                children: [
                 TrailerTab(),
                  BoxOfficeTab()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
