import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:health_service/constants/theme.dart';
import 'package:health_service/routes/app_router.dart';
import 'package:health_service/ui/util/shared/app_buttons.dart';

@RoutePage()
class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: [
              _buildPage(
                  'assets/images/y1.jpg',
                  'Welcome to You Health Community',
                  'Kids are at risk for heatstroke if they overdress or do intense physical activity in hot weather without drinking enough liquids.'),
              _buildPage(
                  'assets/images/y1.jpg',
                  'Welcome to You Health Community',
                  'Kids are at risk for heatstroke if they overdress or do intense physical activity in hot weather without drinking enough liquids.'),
              _buildPage(
                  'assets/images/y1.jpg',
                  'Welcome to You Health Community',
                  'Kids are at risk for heatstroke if they overdress or do intense physical activity in hot weather without drinking enough liquids.'),
            ],
          ),
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                outlinedButton(context,
                    text: "Get Started",
                    height: 60,
                    width: 300,
                    isOulined: true,
                    color: primaryWhite, onPressed: () {
                  context.router.push(const SignInRoute());
                })
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPage(String imagePath, String title, String subtitle) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Container(
            color:
                Colors.black.withOpacity(0.5), // Adjust the opacity as needed
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
