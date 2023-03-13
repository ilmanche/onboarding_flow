import 'package:basic_onboarding_app/widget/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _MyOnboardingScreenState();
}

class _MyOnboardingScreenState extends State<OnboardingScreen> {
  final _controller = PageController();
  late bool _isLastPage;

  @override
  void initState() {
    _isLastPage = false;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (index) {
              setState(() {
                _isLastPage = index == 2;
              });
            },
            controller: _controller,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const OnboardingPage(
                color: Color(0xffB0B0D4),
                image: 'assets/images/image1.png',
                title: 'Check your Crypto Wallet',
                subtitle:
                    'You will get an overview of the current crypto market and its prices',
              ),
              const OnboardingPage(
                color: Color(0xff9794F2),
                image: 'assets/images/image2.png',
                title: 'Receive useful Information',
                subtitle: 'You get useful information to invest smarter',
              ),
              const OnboardingPage(
                color: Color(0xffB6B9F2),
                image: 'assets/images/image3.png',
                title: 'Manage your wealth',
                subtitle:
                    'With our beautiful charts you can see how your investments develop',
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80, left: 20, right: 20),
            child: Align(
              alignment: Alignment.topCenter,
              //Stepper
              child: SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: SlideEffect(
                  dotColor:
                      const Color.fromARGB(255, 201, 202, 203).withOpacity(0.3),
                  dotHeight: 6,
                  dotWidth: 62,
                  spacing: 8,
                  activeDotColor: const Color.fromARGB(255, 255, 255, 255),
                ),
                onDotClicked: (index) => _controller.animateToPage(index,
                    duration: const Duration(microseconds: 350),
                    curve: Curves.easeIn),
              ),
            ),
          ),
          //Is it the last page ? If yes show only on Textbutton
          _isLastPage
              ? Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white,
                          minimumSize: const Size.fromHeight(50),
                        ),
                        child: const Text(
                          'Start',
                          style: TextStyle(fontSize: 18),
                        ),
                        onPressed: () async {},
                      )),
                )
          //If not show two Textbuttons
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 24, bottom: 20),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: TextButton(
                          child: const Text(
                            'Skip',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          onPressed: () => _controller.jumpToPage(3),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 24, bottom: 20),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: SizedBox(
                          height: 56,
                          width: 56,
                          child: TextButton(
                            style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black,
                                tapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap),
                            child: const Icon(Icons.arrow_right_alt_outlined),
                            onPressed: () => _controller.nextPage(
                                duration: const Duration(milliseconds: 350),
                                curve: Curves.easeIn),
                          ),
                        ),
                      ),
                    )
                  ],
                )
        ],
      ),
    );
  }
}
