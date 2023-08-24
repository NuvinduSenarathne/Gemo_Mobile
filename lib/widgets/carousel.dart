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
          .map((url) => Card(
                elevation: 4,
                child: Image.asset(url),
              ))
          .toList(),
      options: CarouselOptions(
        height: 400,
        aspectRatio: 16/9,
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}