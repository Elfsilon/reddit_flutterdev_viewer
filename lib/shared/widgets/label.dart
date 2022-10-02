import 'package:flutter/material.dart';
import 'package:reddit_flutterdev_viewer/constants/constants.dart';

class ColorLabel extends StatelessWidget {
  const ColorLabel({
    Key? key,
    required this.text,
    required this.fgColor,
    required this.bgColor,
  }) : super(key: key);

  final String text;
  final Color fgColor;
  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: AppConstants.borderRadius,
        border: Border.all(
          color: fgColor,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(text, style: TextStyle(color: fgColor, fontSize: 12)),
        ],
      ),
    );
  }
}