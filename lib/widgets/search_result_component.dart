import 'package:brahma/utils/colors.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchResultComponent extends StatelessWidget {
  final String linkToGo;
  final String link;
  final String text;
  final String desc;
  const SearchResultComponent({
    Key? key,
    required this.linkToGo,
    required this.link,
    required this.text,
    required this.desc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // showing the link at the top first
        Text(
          link,
        ),

        const SizedBox(
          height: 8,
        ),
        // showing the text to display as header with link
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: GestureDetector(
            onTap: () async {
              if (await canLaunchUrl(Uri.parse(linkToGo))) {
                await launchUrl(Uri.parse(linkToGo));
              }
            },
            child: RichText(
              text: TextSpan(
                text: text,
                style: const TextStyle(
                  color: blueColor,
                  fontSize: 20,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () async {
                    if (await canLaunchUrl(Uri.parse(linkToGo))) {
                      await launchUrl(Uri.parse(linkToGo));
                    }
                  },
              ),
            ),
          ),
        ),

        // showing the meta data or the description of the wbesite
        Text(
          desc,
          style: const TextStyle(
            fontSize: 14,
            color: primaryColor,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Divider(
            thickness: 1,
            height: 0,
            color: searchBorder,
          ),
        ),
      ],
    );
  }
}
