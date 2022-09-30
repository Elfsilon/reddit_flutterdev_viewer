import 'package:flutter/material.dart';

class Choice extends StatelessWidget {
  const Choice({
    super.key,
    required this.condition,
    required this.baseChild,
    required this.altChild,
  });

  final Widget baseChild;
  final Widget altChild;
  final bool condition;

  @override
  Widget build(BuildContext context){
    return condition ? baseChild : altChild;
  }
}