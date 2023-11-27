import 'package:flutter/material.dart';

const Color blueColor = Colors.blue;
const Color redColor = Colors.red;
const Color greenColor = Colors.green;
const Color greyColor = Colors.grey;
const Color yellowColor = Colors.yellow;
const Color orangeColor = Colors.orange;
const Color blackColor = Colors.black;
const Color whiteColor = Colors.white;
const Color goldenColor = Colors.amberAccent;

const Color transparentColor = Colors.transparent;

const Color backgroundColor = Color.fromARGB(255, 255, 255, 255);
const Color secondaryColor = Color(0xff61C3F2);

Map<int, Color> color = {
  50: const Color.fromRGBO(255, 255, 255, .1),
  100: const Color.fromRGBO(255, 255, 255, .2),
  200: const Color.fromRGBO(255, 255, 255, .3),
  300: const Color.fromRGBO(255, 255, 255, .4),
  400: const Color.fromRGBO(255, 255, 255, .5),
  500: const Color.fromRGBO(255, 255, 255, .6),
  600: const Color.fromRGBO(255, 255, 255, .7),
  700: const Color.fromRGBO(255, 255, 255, .8),
  800: const Color.fromRGBO(255, 255, 255, .9),
  900: const Color.fromRGBO(255, 255, 255, 1),
};
MaterialColor kPrimaryColor = MaterialColor(0xff2E2739, color);
