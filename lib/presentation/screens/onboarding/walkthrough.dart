import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn/presentation/screens/auth/authentication.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../widgets/walkthrough/walkthrough_template.dart';

class WalkthroughScreen extends StatefulWidget {
  const WalkthroughScreen({super.key});

  @override
  WalkthroughScreenState createState() => WalkthroughScreenState();
}

class WalkthroughScreenState extends State<WalkthroughScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              children: [
                walkthroughTemplate(
                  image: 'asset/svgs/splash-img/splash-img-1.svg',
                  title: 'Create your own plate',
                  subtitle:
                      'Create unforgettable memories with our unique feature to curate your favorite cuisines and food, tailored to your special occasion.',
                ),
                walkthroughTemplate(
                  image: 'asset/svgs/splash-img/splash-img-2.svg',
                  title: 'Exquisite Catering',
                  subtitle:
                      'Experience culinary artistry like never before with our innovative and exquisite cuisine creations',
                ),
                walkthroughTemplate(
                  image: 'asset/svgs/splash-img/splash-img-3.svg',
                  title: 'Personal Order Executive',
                  subtitle:
                      'Embark on a personalized culinary journey with our dedicated one-to-one customer support, ensuring a seamless and satisfying experience every step of the way.',
                ),
              ],
            ),
            Positioned(
              top: 24.sp,
              right: 24.sp,
              child: GestureDetector(
                onTap: () {
                  if (_currentIndex != 2) {
                    _pageController.animateToPage(3,
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.ease);
                  }
                },
                child: Container(
                  height: 22.sp,
                  width: 56.sp,
                  decoration: BoxDecoration(
                    color: Theme.of(context).disabledColor.withOpacity(.2),
                    borderRadius: BorderRadius.all(Radius.circular(5.r)),
                  ),
                  child: Center(
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 14.sp,
                        fontFamily: "Lex",
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 50,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: 3,
                    effect: SwapEffect(
                      activeDotColor: Theme.of(context).primaryColor,
                      dotHeight: 8.sp,
                      dotWidth: 24.sp,
                      type: SwapType.normal,
                    ),
                  ),
                  const SizedBox(height: 20),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: _currentIndex == 2 ? 180.sp : 60.sp,
                    height: 60.sp,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_currentIndex < 2) {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        } else {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const AuthScreen(),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.sp),
                        ),
                        padding: const EdgeInsets.all(10),
                        backgroundColor: _currentIndex == 3
                            ? Theme.of(context).primaryColor
                            : const Color.fromRGBO(224, 212, 236, 1),
                        side: _currentIndex == 3
                            ? const BorderSide(
                                color: Color.fromRGBO(224, 212, 236, 1),
                                width: 10)
                            : BorderSide.none,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          if (_currentIndex == 2)
                            Flexible(
                              child: AnimatedOpacity(
                                opacity: _currentIndex == 2 ? 1.0 : 0.0,
                                duration: const Duration(milliseconds: 300),
                                child: Text(
                                  'Get Started',
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          AnimatedOpacity(
                            opacity: _currentIndex == 2 ? 1.0 : 0.0,
                            duration: const Duration(milliseconds: 300),
                          ),
                          _currentIndex == 3
                              ? const Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                )
                              : Flexible(
                                  child: CircleAvatar(
                                    backgroundColor:
                                        Theme.of(context).primaryColor,
                                    child: const Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
