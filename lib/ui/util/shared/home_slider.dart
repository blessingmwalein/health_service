import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:health_service/constants/theme.dart';
import 'package:health_service/ui/util/icon.dart';

class HomeSlider extends StatefulWidget {
  final double imageHeight;

  const HomeSlider({Key? key, required this.imageHeight}) : super(key: key);

  @override
  _ServiceSliderState createState() => _ServiceSliderState();
}

class _ServiceSliderState extends State<HomeSlider> {
  int _currentIndex = 0;
  final List<String> _imageList = [
    "assets/images/slider1.jpg",
    "assets/images/slider2.jpg",
    "assets/images/slider3.png",
    // Add more image URLs as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter, // Align dots to the center bottom
      children: [
        CarouselSlider(
          items: _imageList.map((url) {
            return Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(url),
                  fit: BoxFit.cover,
                ),
              ),
            );
          }).toList(),
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
            height: widget.imageHeight, // Adjust the height as needed
            viewportFraction: 1.0,
            enableInfiniteScroll: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
          ),
        ),
        Positioned(
          bottom: 16,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _imageList.map((url) {
              int index = _imageList.indexOf(url);
              return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index ? primaryOrange : primaryWhite,
                ),
              );
            }).toList(),
          ),
        ),
        Positioned(
          right: 16,
          bottom: 10,
          child: Container(
            width: 60,
            padding: const EdgeInsets.all(3.0),
            margin: const EdgeInsets.only(right: 3, bottom: 3),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Row(
              children: [
                myIcon(
                    path: "assets/icons/star.svg",
                    width: 15,
                    height: 15,
                    iconColor: Colors.orange),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  '4.8',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: primaryBlack,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
