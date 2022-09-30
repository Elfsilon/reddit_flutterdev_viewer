import 'package:flutter/material.dart';
import 'package:reddit_flutterdev_viewer/constants/constants.dart';

class IconLabel extends StatelessWidget {
  const IconLabel({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.successMuted,
        borderRadius: AppConstants.borderRadius,
      ),
      padding: const EdgeInsets.all(AppConstants.spaceS),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: AppColors.success),
          const SizedBox(width: AppConstants.spaceS),
          Text(text, style: const TextStyle(color: AppColors.success, fontSize: 20)),
        ],
      ),
    );
  }
}