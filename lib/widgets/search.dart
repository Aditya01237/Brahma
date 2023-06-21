import 'package:brahma/screens/search_screen.dart';
import 'package:brahma/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Text(
            "Brahma",
            style: TextStyle(
                letterSpacing: 5,
                fontFamily: 'google-font',
                // fontWeight: FontWeight.bold,
                color: Colors.orange.shade300,
                fontSize: size.height * (0.12)),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        SizedBox(
          width: size.width >= 820 ? size.width * 0.4 : size.width * 0.8,
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
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: "Search or type a URL",
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: searchBorder),
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.orange.shade300),
                borderRadius: const BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              // prefixIcon: const Padding(
              //     padding: EdgeInsets.all(16.0), child: Icon(Icons.search)),
              prefixIcon: const Padding(
                padding: EdgeInsets.all(16),
                child: Icon(Icons.search),
              ),
              prefixIconColor: MaterialStateColor.resolveWith((states) =>
                  states.contains(MaterialState.focused)
                      ? Colors.orange.shade300
                      : searchBorder),
              suffixIcon: Padding(
                padding: const EdgeInsets.all(16),
                child: SvgPicture.asset(
                  'assets/images/mic-icon.svg',
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
          children: [
            Container(
              height: size.height * 0.06,
              width: size.height * 0.06,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.shade200,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Icon(Icons.add),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('Add shortcut')
          ],
        )
      ],
    );
  }
}
