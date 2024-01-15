import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:health_service/constants/theme.dart';
import 'package:health_service/constants/urls.dart';
import 'package:health_service/ui/util/icon.dart';

class ServiceSlider extends StatefulWidget {
  final imageHeight;
  final image;
  const ServiceSlider(
      {Key? key, required this.imageHeight, required this.image})
      : super(key: key);
  @override
  _ServiceSliderState createState() => _ServiceSliderState();
}

class _ServiceSliderState extends State<ServiceSlider> {
  int _currentIndex = 0;
  final List<String> _imageList = [
    "assets/images/service1.jpg",
    "assets/images/service2.jpg",
    "assets/images/service3.jpeg",
    // Add more image URLs as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        // CarouselSlider(
        //   items: _imageList.map((url) {
        //     return Container(
        //       width: MediaQuery.of(context).size.width,
        //       decoration: BoxDecoration(
        //         image: DecorationImage(
        //           image: AssetImage(url),
        //           fit: BoxFit.cover,
        //         ),
        //         borderRadius: BorderRadius.only(
        //           topLeft: Radius.circular(10),
        //           topRight: Radius.circular(10),
        //         ),
        //       ),
        //     );
        //   }).toList(),
        //   options: CarouselOptions(
        //     onPageChanged: (index, reason) {
        //       setState(() {
        //         _currentIndex = index;
        //       });
        //     },
        //     height: widget.imageHeight, // Adjust the height as needed
        //     viewportFraction: 1.0,
        //     enableInfiniteScroll: false,
        //   ),
        // ),
        Center(
          child: FadeInImage(
            image: NetworkImage(
              '${UrlStrings.imagesBase}${widget.image}',
            ),
            placeholder: const AssetImage('assets/images/default.jpg'),
            width: double.infinity,
            // width: 100,
            // height: 100,
            fit: BoxFit.cover,
            imageErrorBuilder: (context, error, stackTrace) {
              return Image.asset(
                'assets/images/default.jpg',
                height: 40.0,
                // width: 40.0,
              );
            },
          ),
        ),
        Container(
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
        //like button on top right corner
        Positioned(
          top: 0,
          right: 0,
          child: Container(
            width: 35,
            height: 35,
            padding: const EdgeInsets.all(6.0),
            margin: const EdgeInsets.only(right: 3, top: 3),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            child: myIcon(
                path: "assets/icons/heart.svg",
                width: 15,
                height: 15,
                iconColor: Colors.red),
          ),
        ),
      ],
    );
  }
}
