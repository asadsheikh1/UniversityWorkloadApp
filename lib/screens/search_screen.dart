import 'package:binary_brains/constants/api.dart';
import 'package:binary_brains/constants/constant.dart';
import 'package:binary_brains/screens/search/interest_search.dart';
import 'package:binary_brains/screens/search/location_search.dart';
import 'package:binary_brains/screens/search/major_search.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  static const routeName = '/search-screen';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'We\'ve made the search easy for you! 🎉',
                  style: kTextStyle.copyWith(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
              ),
              ListTile(
                title: GestureDetector(
                  onTap: () {
                    showSearch(
                      context: context,
                      delegate: MajorSearchDelegate(),
                    );
                  },
                  child: Text(
                    'Search by major',
                    style: kTextStyle.copyWith(
                      color: kTextColor,
                    ),
                  ),
                ),
                leading: FaIcon(
                  FontAwesomeIcons.search,
                  color: kTextColor,
                ),
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Lists students with the major you selected.',
                            style: kTextStyle.copyWith(
                              color: kOrangeColor,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'To narrow your search to a specific course, example search such as Flutter.',
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
              Divider(
                color: kLightTextColor,
              ),
              ListTile(
                title: GestureDetector(
                  onTap: () {
                    showSearch(
                      context: context,
                      delegate: InterestSearchDelegate(),
                    );
                  },
                  child: Text(
                    'Search by interest',
                    style: kTextStyle.copyWith(
                      color: kTextColor,
                    ),
                  ),
                ),
                leading: FaIcon(
                  FontAwesomeIcons.search,
                  color: kTextColor,
                ),
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Lists students with the interest you selected.',
                            style: kTextStyle.copyWith(
                              color: kOrangeColor,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'To narrow your search to a specific course, example search such as Computer Science.',
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
              Divider(
                color: kLightTextColor,
              ),
              ListTile(
                title: GestureDetector(
                  onTap: () {
                    showSearch(
                      context: context,
                      delegate: LocationSearchDelegate(),
                    );
                  },
                  child: Text(
                    'Search by location',
                    style: kTextStyle.copyWith(
                      color: kTextColor,
                    ),
                  ),
                ),
                leading: FaIcon(
                  FontAwesomeIcons.search,
                  color: kTextColor,
                ),
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
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Lists students with the location you selected.',
                            style: kTextStyle.copyWith(
                              color: kOrangeColor,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'To narrow your search to a specific course, example search such as Karachi.',
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
              Divider(
                color: kLightTextColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
