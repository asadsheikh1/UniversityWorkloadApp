import 'package:binary_brains/constants/constant.dart';
import 'package:binary_brains/utils/cache.dart';
import 'package:flutter/material.dart';
import 'package:binary_brains/constants/api.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:flutter';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = '/home-screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List images = [
    'assets/images/1.jpeg',
    'assets/images/2.jpeg',
    'assets/images/3.png',
    'assets/images/4.png',
    'assets/images/5.jpg',
  ];
  getDataInList() {
    value = [];
    Api.databaseUser.onValue.listen((event) {
      for (final child in event.snapshot.children) {
        setState(() {
          value.add(child.value);
          print(child);
        });
      }
      print(value);
    }, onError: (error) {
      print('Another Bad Try');
    });
  }

  @override
  void initState() {
    getDataInList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kTransparentColor,
        elevation: 0,
        title: SizedBox(
          height: 30,
          width: double.infinity,
          child: Text(
            'Good evening! 👋',
            style: kTextStyle,
          ),
        ),
        actions: [
          Tooltip(
            message: 'Favourites',
            child: IconButton(
              onPressed: () {},
              icon: const FaIcon(FontAwesomeIcons.heart),
            ),
          ),
          Tooltip(
            message: 'History',
            child: IconButton(
              onPressed: () {},
              icon: const FaIcon(FontAwesomeIcons.history),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              items: images.map((vale) {
                return Container(
                  margin: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: AssetImage(vale),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                height: 180.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: false,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'University of FAST',
              style: kTextStyle.copyWith(fontSize: 18),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: kLightTextColor,
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'There are a bunch of student apps that help make the learning experience smooth for the learners. Binary Brains is one such app that helps students to access to other students.',
                      style: kTextStyle.copyWith(
                        color: kTextColor,
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Explore our Events!',
              style: kTextStyle.copyWith(fontSize: 18),
            ),
            const SizedBox(
              height: 20,
            ),
            CarouselSlider(
              items: images.map((vale) {
                return Container(
                  margin: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: AssetImage(vale),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                height: 180.0,
                reverse: true,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: false,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
