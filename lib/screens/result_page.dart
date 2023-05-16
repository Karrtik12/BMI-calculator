import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:flutter/material.dart';

import '../components/reusable_card.dart';
import '../constants.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({
    Key? key,
    required this.bmi,
    required this.resultText,
    required this.interpretation,
  }) : super(key: key);

  final String bmi, resultText, interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'BMI CALCULATOR',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text(
                "Your Result",
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    resultText.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmi,
                    style: kBMITextStyle,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle,
                  )
                ],
              ),
              onPress: () {},
            ),
          ),
          BottomButton(
            title: "RE-CALCULATE",
            onPress: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
