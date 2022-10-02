import 'package:flutter/material.dart';
import 'package:reddit_flutterdev_viewer/constants/constants.dart';
import 'package:reddit_flutterdev_viewer/features/post_viewer/ui/screens/post_list.dart';
import 'package:reddit_flutterdev_viewer/shared/utils/create_material_color.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: createMaterialColor(AppColors.primary),
        scaffoldBackgroundColor: AppColors.appBg,
        // textTheme: TextTheme(
        //   bodyText2: TextStyle(
        //     fontSize: 24,
        //   ),
        // ),
      ),
      home: const PostListScreen(),
    );
  }
}