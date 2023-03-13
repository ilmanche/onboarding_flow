import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  final Color color;
  final String image;
  final String title;
  final String subtitle;

  const OnboardingPage({
    super.key,
    required this.color,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    //OnboardingPage
    return Container(
      //background-color
      color: color,
      child: Stack(
        children: [
          Container(
            //Image
            padding: const EdgeInsets.fromLTRB(0, 100, 0, 200),
            alignment: Alignment.center,
            child: Image.asset(image),
          ),
          const SizedBox(height: 45),
          //Title
          Padding(
            padding: const EdgeInsets.only(top: 250, right: 20, left: 20),
            child: Center(
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          //Subtitle
          const SizedBox(height: 35),
          //Subtitle
          Padding(
            padding: const EdgeInsets.only(top: 350, right: 20, left: 20),
            child: Center(
              child: Text(
                subtitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.normal),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
