import 'package:binary_brains/components/curve_clipper.dart';
import 'package:flutter/material.dart';
import 'package:binary_brains/constants/constant.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});
  static const routeName = '/about-screen';

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                clipBehavior: Clip.none,
                children: [
                  ClipPath(
                    clipper: CurveClipper(),
                    child: Container(
                      color: const Color(0XFFED9121),
                      height: 100.0,
                    ),
                  ),
                  ClipPath(
                    clipper: CurveClipper(),
                    child: Container(
                      color: const Color(0XFFFFA836),
                      height: 70.0,
                    ),
                  ),
                  ClipPath(
                    clipper: CurveClipper(),
                    child: Container(
                      color: const Color(0XFFFF8C00),
                      height: 40.0,
                    ),
                  ),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Tooltip(
                      message: 'Back',
                      child: CircleAvatar(
                        backgroundColor: kWhiteColor,
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: FaIcon(
                            FontAwesomeIcons.arrowLeft,
                            color: kBlackColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                'About us',
                style: kTextStyle.copyWith(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: kLightTextColor,
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Who we are?.',
                            style: kTextStyle.copyWith(
                              color: kOrangeColor,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'We are a team of two brains. Love to get our hands dirty with Computers and especially with mobile stuff.',
                            style: kTextStyle.copyWith(
                              color: kTextColor,
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'Our code is concise, giving the audience important details for specialization and interests. We provide visitors the option of receiving more information about the platform.',
                            style: kTextStyle.copyWith(
                              color: kTextColor,
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'The app color scheme is gentle, combining of orange and white with a minimal touch that channel positive vibes. It helps to engage visitors even more, allowing the areas of color and photographs to shift throughout the page as they browse.',
                            style: kTextStyle.copyWith(
                              color: kTextColor,
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
