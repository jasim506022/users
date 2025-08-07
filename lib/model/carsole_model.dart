import 'package:flutter/material.dart';

import '../res/app_asset/image_asset.dart';

class CarouselModel {
  final String category;
  final String title;
  final String number;
  final String image;
  final Color color;

  CarouselModel(
      {required this.category,
      required this.title,
      required this.number,
      required this.image,
      required this.color});
}

List<CarouselModel> caroselList = [
  CarouselModel(
    category: "Organice Food",
    title: "Savon Stories",
    number: "Buy 1 get 1 free",
    image: AppImage.carouselOrange,
    color: const Color.fromARGB(255, 245, 216, 219),
  ),
  CarouselModel(
    category: "Milk",
    title: "Savon Stories",
    number: "Buy 1 get 1 free",
    image: AppImage.carouselMilk,
    color: const Color.fromARGB(255, 216, 230, 245),
  ),
  CarouselModel(
    color: const Color.fromARGB(255, 202, 242, 219),
    category: "Fresh Vegetable",
    title: "Fresh Vegetable Stories",
    number: "Buy 1 get 1 free",
    image: AppImage.carouselVegetables,
  ),
  CarouselModel(
    color: const Color.fromARGB(255, 242, 245, 216),
    category: "Fruits",
    title: "Fresh Fruits Stories",
    number: "Buy 1 get 1 free",
    image: AppImage.carouselFruits,
  ),
];
