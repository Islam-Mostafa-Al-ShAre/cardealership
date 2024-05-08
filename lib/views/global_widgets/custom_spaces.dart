import 'package:flutter/material.dart';

verticalSpace(double height) {
  return SizedBox(
    height: height,
  );
}

horizontalSpace(double width) {
  return SizedBox(
    width: width,
  );
}

class VerticalSpace extends StatelessWidget {
  const VerticalSpace({super.key, required this.height});
  final double height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}

class HorizontalSpace extends StatelessWidget {
  const HorizontalSpace({super.key, required this.width});
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}
