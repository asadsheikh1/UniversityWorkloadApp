import 'package:binary_brains/constants/constant.dart';
import 'package:binary_brains/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});
  static const routeName = '/on-board';

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  PageController pageController = PageController(initialPage: 0);
  int currentIndexPage = 0;
  String buttonText = 'Next';
  double percent = 0.34;

  List<Map<String, dynamic>> sliderList = [
    {
      "icon": 'assets/images/onboard1.png',
      "title": 'Welcome to Binary Brains',
      "description":
          'We are a team of two brains. Love to get our hands dirty with Computers and especially with mobile stuff.',
    },
    {
      "icon": 'assets/images/onboard2.png',
      "title": 'Search for your interests',
      "description":
          'Our code is concise, giving the audience important details for specialization and interests. We provide visitors the option of receiving more information about the platform.',
    },
    {
      "icon": 'assets/images/onboard3.png',
      "title": 'Give feedback to us',
      "description":
          'The app color scheme is gentle, combining of orange and white with a minimal touch that channel positive vibes. It helps to engage visitors even more, allowing the areas of color and photographs to shift throughout the page as they browse.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kGreyColor,
        iconTheme: IconThemeData(color: kWhiteColor),
        elevation: 0.0,
        actions: [
          const SizedBox(width: 20.0),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed(SignInScreen.routeName);
              },
              child: Text(
                'Skip',
                style: kTextStyle.copyWith(
                  fontSize: 16.0,
                  color: kOrangeColor,
                ),
              ),
            ),
          ),
          const SizedBox(width: 30.0),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.only(top: 8, bottom: 8),
                height: 550,
                width: 340,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    PageView.builder(
                      itemCount: sliderList.length,
                      controller: pageController,
                      onPageChanged: (int index) => currentIndexPage = index,
                      itemBuilder: (_, index) {
                        return Column(
                          children: [
                            Image.asset(
                              sliderList[index]['icon'],
                              fit: BoxFit.fill,
                              height: 340,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10.0,
                                right: 10.0,
                                top: 15.0,
                                bottom: 15.0,
                              ),
                              child: Text(
                                sliderList[index]['title'],
                                style: kTextStyle,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20.0, right: 20.0),
                              child: SizedBox(
                                child: Text(
                                  sliderList[index]['description'],
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 5,
                                  style: kTextStyle.copyWith(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.normal,
                                    color: kTextColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            CircularPercentIndicator(
              radius: 50.0,
              lineWidth: 5.0,
              progressColor: kOrangeColor,
              percent: percent,
              animation: true,
              center: GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndexPage < 2
                        ? percent = percent + 0.33
                        : percent = 1.0;
                    currentIndexPage < 2
                        ? pageController.nextPage(
                            duration: const Duration(microseconds: 3000),
                            curve: Curves.bounceInOut)
                        : Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignInScreen(),
                            ),
                          );
                  });
                },
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    color: kOrangeColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.keyboard_double_arrow_right_sharp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
