import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImagesGaleria extends StatelessWidget {
  final List<String>? urls;

  const ImagesGaleria({super.key,this.urls});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: CarouselSlider(
        options: CarouselOptions(autoPlay: true), // options for carousel
        items: urls!.map((item) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Image.network(item, fit: BoxFit.cover),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
