import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImageCarousel extends StatelessWidget {
  final List<String> imageUrls = [
    'assets/1.jpg',
    'assets/2.jpg',
    'assets/3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
  items: imageUrls
      .map((url) => Image.asset(url))
      .toList(), 
      options: CarouselOptions(
        
      )
    // 'autoplay': true,
    // 'interval': 3000,
    // 'aspectRatio': 1.5,
    // 'padding': EdgeInsets.all(10),
  
);
  }
}