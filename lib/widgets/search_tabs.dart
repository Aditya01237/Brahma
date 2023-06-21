import 'package:brahma/widgets/search_tab_buttons.dart';
import 'package:flutter/material.dart';

class SearchTabs extends StatelessWidget {
  const SearchTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 55,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SearchTabButtons(text: 'All'),
            SizedBox(
              width: 20,
            ),
            SearchTabButtons(text: 'Images'),
            SizedBox(
              width: 20,
            ),
            SearchTabButtons(text: 'Map'),
            SizedBox(
              width: 20,
            ),
            SearchTabButtons(text: 'News'),
            SizedBox(
              width: 20,
            ),
            SearchTabButtons(text: 'Video'),
            SizedBox(
              width: 20,
            ),
            SearchTabButtons(text: 'Tutorial'),
            SizedBox(
              width: 20,
            ),
          ],
        ),
      ),
    );
  }
}
