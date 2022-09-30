import 'package:flutter/material.dart';
import 'package:reddit_flutterdev_viewer/constants/constants.dart';

AppBar customAppBar(String title) => AppBar(
  title: Text(title),
  centerTitle: true,
  backgroundColor: AppColors.appBg,
);