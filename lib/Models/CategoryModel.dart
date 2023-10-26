import 'package:flutter/material.dart';

class CategoryModel{
  String name;
  String id;
  String image;
  Color color;

  CategoryModel(this.name, this.id, this.image, this.color);

  static List<CategoryModel> getCategories(){
    return[
      CategoryModel("Sports", "sports", "assets/images/sports.png", const Color(0xffC91C22)),
      CategoryModel("General", "general", "assets/images/Politics.png", const Color(0xff003E90)),
      CategoryModel("Health", "health", "assets/images/health.png", const Color(0xffED1E79)),
      CategoryModel("Business", "business", "assets/images/bussines.png", const Color(0xffCF7E48)),
      CategoryModel("Technology", "technology", "assets/images/environment.png", const Color(0xff4882CF)),
      CategoryModel("Science", "science", "assets/images/science.png", const Color(0xffF2D352)),
      CategoryModel("Entertainment", "entertainment", "assets/images/environment.png", Colors.grey),
    ];
  }
}