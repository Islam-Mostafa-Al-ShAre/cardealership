import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
    required this.backGroundColor,
    required this.icon,
    this.onTap,
    this.iconColor,
  });
  final Color backGroundColor;
  final Color? iconColor;

  final IconData icon;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 55,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backGroundColor,
      ),
      child: Icon(
        icon,
        size: 30,
        color: iconColor,
      ),
    );
  }
}
