import 'package:brahma/responsive/mobile_screen_layout.dart';
import 'package:brahma/responsive/responsive_layout_screen.dart';
import 'package:brahma/responsive/web_screen_layout.dart';
import 'package:brahma/utils/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Brahma',
        theme:
            ThemeData.dark().copyWith(scaffoldBackgroundColor: backgroundColor),
        home: const ResponsiveLayoutScreen(
            mobileLayoutScreen: MobileScreenLayout(),
            webLayoutScreen: WebScreenLayout()));
  }
}
