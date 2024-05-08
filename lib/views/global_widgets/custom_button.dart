import 'package:flutter/material.dart';

class CostomButton extends StatelessWidget {
  final String text;
  final double width;
  final double height;
  final Function OnPressed;
  const CostomButton(
      {super.key,
      required this.text,
      this.width = 150,
      this.height = 60,
      required this.OnPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: () {
          OnPressed();
        },
        child: Text(
          text,
        ),
      ),
    );
  }
}
