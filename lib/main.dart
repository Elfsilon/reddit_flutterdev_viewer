import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_flutterdev_viewer/app.dart';

void main() async {
  runApp(const ProviderScope(child: App()));
}