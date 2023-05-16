import 'package:flutter/material.dart';

import '../constants.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    Key? key,
    required this.onPress,
    required this.title,
  }) : super(key: key);
  final onPress;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: Center(
          child: Text(
            title,
            style: kLargeButtonTextStyle,
          ),
        ),
        color: kBottomContainerColour,
        height: kBottomContainerHeight,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 10),
      ),
    );
  }
}
