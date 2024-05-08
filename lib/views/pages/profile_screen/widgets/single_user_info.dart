import 'package:flutter/material.dart';

class SingleUserProfileIfo extends StatelessWidget {
  const SingleUserProfileIfo({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_right_alt))
      ],
    );
  }
}
