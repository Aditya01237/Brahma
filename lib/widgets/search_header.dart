import 'package:brahma/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/colors.dart';

class SearchHeader extends StatelessWidget {
  const SearchHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 28, right: 15, top: 4),
            child: Text(
              "Brahma",
              style: TextStyle(
                  letterSpacing: 5,
                  fontFamily: 'google-font',
                  // fontWeight: FontWeight.bold,
                  color: Colors.orange.shade300,
                  fontSize: size.height * (0.04)),
            ),
          ),
          const SizedBox(
            width: 27,
          ),
          Container(
            width: size.width * 0.45,
            height: size.height * 0.07,
            decoration: BoxDecoration(
                color: searchColor,
                borderRadius: BorderRadius.circular(22),
                border: Border.all(
                  color: searchColor,
                )),
            child: TextFormField(
              onFieldSubmitted: (query) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => SearchScreen(
                      start: '0',
                      searchQuery: query,
                    ),
                  ),
                );
              },
              style: const TextStyle(fontSize: 16),
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: searchBorder),
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
                suffixIconColor: MaterialStateColor.resolveWith((states) =>
                    states.contains(MaterialState.focused)
                        ? Colors.orange.shade300
                        : blueColor),
                suffixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 150),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/images/mic-icon.svg',
                          height: 20,
                          width: 20,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Icon(
                          Icons.search,
                        )
                      ],
                    ),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange.shade300),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
