import 'package:flutter/material.dart';

class RecipeBundle {
  final int id, chefs, recipes;
  final String title, cityName, stationName, imageSrc;
  final List<String> categories;
  final Color? color;

  RecipeBundle(
      {required this.id,
      required this.chefs,
      required this.recipes,
      required this.title,
      required this.cityName,
      required this.stationName,
      required this.categories,
      required this.imageSrc,
      this.color});
}

// Demo list
List<RecipeBundle> recipeBundles = [
  RecipeBundle(
    id: 1,
    chefs: 16,
    recipes: 95,
    title: "リラクゼーションサロンTOTORO",
    cityName: "大宮区",
    stationName: "土呂",
    categories: ["リラク", "エステ", "まつ毛"],
    imageSrc: "assets/images/totoro_img.png",
    // color: Color(0xFFD82D40),
    color: Colors.white,
  ),
  RecipeBundle(
    id: 2,
    chefs: 8,
    recipes: 26,
    title: "Best of 2020",
    cityName: "大宮区",
    stationName: "土呂",
    categories: ["ネイル"],
    imageSrc: "assets/images/totoro_img.png",
    // color: Color(0xFFD82D40),
    color: Colors.white,
  ),
  RecipeBundle(
    id: 3,
    chefs: 10,
    recipes: 43,
    title: "Food Court",
    cityName: "大宮区",
    stationName: "土呂",
    categories: ["まつげ"],
    imageSrc: "assets/images/totoro_img.png",
    // color: Color(0xFFD82D40),
    color: Colors.white,
  ),
];
