import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/colors.dart';
import 'package:netflix/widget/used/genre_card.dart';
import 'package:netflix/widget/used/profile_screen_genre.dart';

class ProfileScreenMobile extends StatefulWidget {

  @override
  _ProfileScreenMobileState createState() => _ProfileScreenMobileState();
}

class _ProfileScreenMobileState extends State<ProfileScreenMobile> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: size.width,
                height: size.height*.45,
                child:Stack(
                  children: [
                    Container(
                      width:size.width,
                      height: size.height*.35,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage('https://i.postimg.cc/rpGxJctG/netflix-logo2.jpg'
                              ),fit: BoxFit.cover
                          )
                      ),
                    ),
                    Positioned(
                      left: size.width*.3,
                    right: size.width*.3,
                    bottom: 0,
                        child:Container(
                          height: size.height*.2,
                          child:Stack(
                            children: [
                              Container(
                                width: size.width*.4,
                                height: size.width*.4,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: mainColorNetflix,width: 2),
                                    image: DecorationImage(
                                        image: NetworkImage("https://i.postimg.cc/Y9cD4pB1/IMG-20210403-172119-957.jpg"),fit: BoxFit.cover
                                    )
                                ),
                              ),
                              Positioned(
                                  right: size.width * .01,
                                  bottom: size.width * .01,
                                  child: Container(
                                    width: size.width * .12,
                                    height: size.width * .12,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white),
                                    child: Center(
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.camera_alt,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ))
                            ],
                          )
                        ))
                  ],
                )
              ),
              Container(
                width: size.width,
                height: size.height*.35,
                padding: EdgeInsets.symmetric(horizontal: size.width*.04,vertical: size.height*.02),
                child: Column(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Lavender256",style: TextStyle(
                            color: Colors.white,fontWeight: FontWeight.bold,fontSize: size.width*.07
                        ),),
                        IconButton(icon: Icon(Icons.edit,color: mainColorNetflix,),)
                      ],
                    ),

                  RichText(text: TextSpan(children: [
                    TextSpan(text: "Gmail:",style: TextStyle(
                      color: Colors.white,fontSize: size.width*.05
                    )),
                    TextSpan(text:" Snchly9890@gmail.com",style: TextStyle(
                      color: mainColorNetflix,fontSize: size.width*.05,fontWeight: FontWeight.bold
                    ))
                  ])),
                    RichText(text: TextSpan(children: [
                      TextSpan(text: "Mobile:",style: TextStyle(
                          color: Colors.white,fontSize: size.width*.05
                      )),
                      TextSpan(text:" +989331779890",style: TextStyle(
                          color: mainColorNetflix,fontWeight: FontWeight.bold,fontSize: size.width*.05
                      ))
                    ])),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                         width: size.width*.3,
                          height: size.width*.11,
                          color: mainColorNetflix,
                        child: Center(child: Text("Edit",style: TextStyle(
                          color: Colors.white,fontWeight: FontWeight.w800
                        ),),),
                      ),
                      Container(
                        width: size.width*.3,
                        height: size.width*.11,
                        color: Colors.white,
                        child: Center(child: Text("Log Out",style: TextStyle(
                            color: mainColorNetflix,fontWeight: FontWeight.w800
                        ),),),
                      ),
                    ],
                  )
                  ],
                ),
              ),
              ProfileScreenGenre()
            ],
          ),
        ),
      ),
    );
  }
}
