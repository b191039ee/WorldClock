import 'package:flutter/material.dart';
import 'package:worldclock/WorldClock/LoadingScreen.dart';
import 'package:worldclock/WorldClock/CountryList.dart';
import 'package:worldclock/WorldClock/HomePage.dart';
void main() {
  runApp(MaterialApp(
  initialRoute: '/',
    routes: {
      '/': (context)=> Loading(),
      '/Home': (context)=> HomePage(),
      '/CountryList': (context)=> ChooseLocation(),

    },
  ),);
}