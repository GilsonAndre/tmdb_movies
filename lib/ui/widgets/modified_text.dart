import 'dart:ui';

import 'package:flutter/material.dart';

class ModifiedText extends StatelessWidget {
  const ModifiedText({
    required this.text,
    required this.size,
    super.key,
  });

  final String text;
  final double size;
  
  @override
  Widget build(BuildContext context) {
    return Text(
      text, style: TextStyle(fontSize: size, color: Colors.white),
    );
  }
}
