import 'package:brahma/utils/colors.dart';
import 'package:flutter/material.dart';

class SearchTabButtons extends StatefulWidget {
  final String text;

  const SearchTabButtons({super.key, required this.text});

  @override
  State<SearchTabButtons> createState() => _SearchTabButtonsState();
}

class _SearchTabButtonsState extends State<SearchTabButtons> {
  bool _isHovered = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Handle button tap here
      },
      onHover: (value) {
        setState(() {
          _isHovered = value;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(
            color: searchBorder,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(30),
          color: _isHovered ? searchBorder : Colors.transparent,
        ),
        child: Text(
          widget.text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
