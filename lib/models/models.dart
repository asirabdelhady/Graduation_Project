
import 'package:flutter/material.dart';

class Notifications{
  String notification;

  Notifications({
    required this.notification,
});
}

class RecommendedPlaces{
  String imagePath;
  String placeName;
  String rating;
  String distance;

  RecommendedPlaces({
    required this.placeName,
    required this.imagePath,
    required this.distance,
    required this.rating,

});
}

class TAttractions{
  String imagePath;
  String placeName;
  String rating;
  String distance;

  TAttractions({
    required this.placeName,
    required this.imagePath,
    required this.distance,
    required this.rating,

  });
}

class Hotels{
  String imagePath;
  String placeName;
  String rating;
  String distance;

  Hotels({
    required this.placeName,
    required this.imagePath,
    required this.distance,
    required this.rating,

  });
}

class Entertainment{
  String imagePath;
  String placeName;
  String rating;
  String distance;

  Entertainment({
    required this.placeName,
    required this.imagePath,
    required this.distance,
    required this.rating,

  });
}

class Categories{
  String imagePath;
  String categoryName;
  String numberOfPlaces;

  Categories({
    required this.categoryName,
    required this.imagePath,
    required this.numberOfPlaces,

  });
}