import 'package:flutter/material.dart';
import 'package:reddit_flutterdev_viewer/constants/constants.dart';

List<Color> getLabelColors(String labelName) {
    switch (labelName) {
      case "Discussion":
      case "Community":
      case "Article":
        return [AppColors.labelA, AppColors.labelAMuted];
      case "Video":
      case "Example":
      case "Plugin":
        return [AppColors.labelC, AppColors.labelCMuted];
      case "Tooling":
        return [AppColors.labelD, AppColors.labelDMuted];
      default:
        return [AppColors.labelB, AppColors.labelBMuted];
    }
  }