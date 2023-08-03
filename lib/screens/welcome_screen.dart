import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:xcesscity/navigation.dart';
import 'package:xcesscity/screens/home_screen.dart';
import 'package:xcesscity/screens/login_screen.dart';
import 'package:xcesscity/screens/question_screen.dart';
import '../models/colors.dart';
import '../widgets/welcome_page_view.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

int currentPage = 1;

class _WelcomeScreenState extends State<WelcomeScreen> {
  final _controller = PageController();

  _onPageViewChange(int page) {
    print("Current Page: " + page.toString());
    int previousPage = page;
    if (page != 0)
      previousPage--;
    else
      previousPage = 2;
    print("Previous page: $previousPage");
    setState(() {
      currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          bottom: 20,
        ),
        height: double.infinity,
        width: double.infinity,
        color: backgroundBlack,
        child: Column(
          children: [
            GestureDetector(
              onTap: () => Navigator.of(context)
                  .pushReplacementNamed(Navigation.routeName),
              child: Container(
                alignment: Alignment.centerRight,
                child: const Text(
                  "SKIP",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 660,
              color: Colors.white,
              child: PageView(
                onPageChanged: _onPageViewChange,
                controller: _controller,
                children: [
                  WelcomePageView(
                    imageUrl: 'lib/assets/images/police.png',
                    title: "Crime & Incident Report",
                    description:
                        " With XcessCity, you can report and stay informed about any potential criminal activities or incidents, promoting a safer city environment",
                  ),
                  WelcomePageView(
                      imageUrl: 'lib/assets/images/event.jpg',
                      title: "Explore events near you",
                      description:
                          " We also facilitates seamless connections among city dwellers, offering a diverse range of local events and experiences"),
                  WelcomePageView(
                    imageUrl: 'lib/assets/images/connectingPeople.jpeg',
                    title: "Connecting People",
                    description:
                        "XcessCITY enables users in the same city to discover and connect others, fostering real-life connections and community engagement.",
                  ),
                ],
              ),
            ),
            Center(
              child: SmoothPageIndicator(
                controller: _controller,
                count: 3,
                onDotClicked: (index) {
                  _controller.animateToPage(index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn);
                  setState(() {
                    currentPage = index;
                  });
                },
                effect: ExpandingDotsEffect(
                    dotHeight: 8, dotWidth: 12, activeDotColor: accentOrange),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                currentPage == 2
                    ? Navigator.of(context).pushNamed(LoginScreen.routeName)
                    : _controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn);
                setState(() {
                  currentPage = currentPage++;
                });
              },
              child: Container(
                width: 200,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: accentOrange,
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                      color: accentOrange.withOpacity(0.7),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Text(
                  currentPage == 2 ? 'Get Started' : 'Next',
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
