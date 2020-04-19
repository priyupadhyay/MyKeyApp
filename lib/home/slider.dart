import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeSlider extends StatefulWidget {
  @override
  _HomeSliderState createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  final List<String> imgList = [
    'assets/images/key1.jpg',
    'assets/images/key2.jpg',
    'assets/images/key3.jpg',
    'assets/images/key4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: <Widget>[
          Center(
            child: CarouselSlider(
              autoPlay: true,
              pauseAutoPlayOnTouch: Duration(seconds: 10),
              height: 350.0,
              viewportFraction: 1.0,
              items: imgList.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset(i, fit: BoxFit.cover));
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
