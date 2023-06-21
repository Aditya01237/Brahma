import 'package:brahma/utils/colors.dart';
import 'package:brahma/widgets/search.dart';
import 'package:flutter/material.dart';

class MobileScreenLayout extends StatelessWidget {
  const MobileScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        actions: <Widget>[
          TextButton(
              onPressed: () {},
              child: const Text(
                'Gmail',
                style:
                    TextStyle(color: primaryColor, fontWeight: FontWeight.w400),
              )),
          const SizedBox(
            width: 10,
          ),
          TextButton(
              onPressed: () {},
              child: const Text(
                'Images',
                style:
                    TextStyle(color: primaryColor, fontWeight: FontWeight.w400),
              )),
          const SizedBox(
            width: 10,
          ),
          IconButton(
              onPressed: () {},
              icon: Image.asset('assets/images/moreapps.png')),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.only(left: 5, right: 5),
        child: Column(
          children: [
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [Search()],
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
