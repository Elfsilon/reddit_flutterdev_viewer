import 'package:flutter/material.dart';
import 'package:reddit_flutterdev_viewer/constants/constants.dart';

SnackBar customSnackbar(String message) {
  return SnackBar(
    duration: const Duration(seconds: 5),
    content: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(right: AppConstants.spaceL), 
          child: Icon(Icons.error, color: AppColors.danger) 
        ),
        Flexible(
          child: Text(message, style: const TextStyle(
            color: AppColors.danger,
          )),
        ),
      ],
    ), 
    backgroundColor: AppColors.dangerMuted,
  );
}