import 'package:flutter/material.dart';

import '../constants.dart';

class GenderCard extends StatelessWidget {
  const GenderCard({
    Key? key,
    required this.genderIcon,
    required this.genderLabel,
  }) : super(key: key);
  final IconData genderIcon;
  final String genderLabel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          genderIcon,
          size: 80,
        ),
        Text(
          genderLabel,
          style: kLabelStyle,
        ),
      ],
    );
  }
}
