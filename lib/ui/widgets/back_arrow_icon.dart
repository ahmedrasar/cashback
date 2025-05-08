import 'package:flutter/material.dart';

class BackArrowIconButton extends StatelessWidget {
  const BackArrowIconButton({super.key, required this.onPressed});
  final void Function() onPressed;

  @override
  Widget build(Object context) {
    return IconButton(
      onPressed: onPressed,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      padding: EdgeInsets.symmetric(horizontal: 25),
      icon: Icon(Icons.arrow_back_ios, size: 30, color: Colors.blue),
    );
  }
}
