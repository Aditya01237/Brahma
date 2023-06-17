import 'package:flutter/material.dart';

class ResponsiveLayoutScreen extends StatelessWidget {
  final Widget mobileLayoutScreen;
  final Widget webLayoutScreen;

  const ResponsiveLayoutScreen(
      {super.key,
      required this.mobileLayoutScreen,
      required this.webLayoutScreen});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth <= 820) {
        return mobileLayoutScreen;
      }
      return webLayoutScreen;
    });
  }
}
