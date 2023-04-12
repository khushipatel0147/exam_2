import 'package:exam_2/Screen/addScreen.dart';
import 'package:exam_2/Screen/homeScreen.dart';
import 'package:exam_2/Screen/missedcallScreen.dart';
import 'package:exam_2/Screen/profileScreen.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/' : (context) => HomeScreen(),
      'profileScreen' : (context) => ProfileScreen(),
      'add' : (context) => NewAdd(),
      'phone' : (context) => Missedcall(),

    },
  ));
}