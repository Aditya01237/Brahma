import 'package:brahma/utils/colors.dart';
import 'package:brahma/widgets/search.dart';
import 'package:flutter/material.dart';

class WebScreenLayout extends StatelessWidget {
  const WebScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
      body: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.20,
            ),
            const Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
