import 'package:flutter/material.dart';

class Film{
  final String name;
  final String imageUrl1;
  final String imageUrl2;
  final String year;
  final String genre;
  final int seasons;
  final String remainTime;
  final String description;

  Film({this.name, this.imageUrl1,this.imageUrl2, this.year, this.genre, this.seasons,this.description,this.remainTime});
}