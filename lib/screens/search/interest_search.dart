import 'package:binary_brains/constants/api.dart';
import 'package:binary_brains/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

class InterestSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const FaIcon(FontAwesomeIcons.xmark),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const FaIcon(FontAwesomeIcons.arrowLeft),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FirebaseAnimatedList(
      query: Api.databaseUser,
      itemBuilder: (context, snapshot, animation, index) {
        return Center(
          child: Text(
            snapshot.child('Interest').value.toString(),
            style: kTextStyle.copyWith(
              color: kTextColor,
              fontSize: 24,
              fontWeight: FontWeight.normal,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    query.isNotEmpty;
    List searchedData = value.where((data) {
      return data['Interest']
          .toString()
          .toLowerCase()
          .contains(query.toLowerCase());
    }).toList();
    return ListView.builder(
      itemCount: searchedData.length,
      itemBuilder: (context, ind) {
        return ListTile(
          title: Text(searchedData[ind]['Interest']),
        );
      },
    );
  }
}
