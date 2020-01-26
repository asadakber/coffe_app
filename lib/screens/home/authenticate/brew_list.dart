import 'package:flutter_app/modals/brew.dart';
import 'package:flutter_app/screens/home/authenticate/brew_title.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/home/authenticate/brew_list.dart';

class BrewList extends StatefulWidget {
  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {

    final brews = Provider.of<List<Brew>>(context) ?? [];

      
//    brews.forEach((brew) {
//      print(brew.name);
//      print(brew.sugars);
//      print(brew.strength);
//    });

    return ListView.builder(
        itemCount: brews.length,
        itemBuilder: (context, index) {
          return BrewTitle(brew: brews[index]);
      },
    );
  }
}