import 'package:bmi_calculator/brains.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:flutter/material.dart';

import '../components/bottom_button.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import '../components/gender_card.dart';

enum Gender { male, female, notSelected }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  InputPageState createState() => InputPageState();
}

class InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.notSelected;
  int selectedHeight = 180;
  int selectedWeight = 60;
  int selectedAge = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                      onPress: () {
                        setState(() {
                          selectedGender = Gender.male;
                        });
                      },
                      colour: selectedGender == Gender.male
                          ? kActiveCardColour
                          : kInactiveCardColour,
                      cardChild: const GenderCard(
                        genderLabel: "MALE",
                        genderIcon: Icons.male,
                      )),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: const GenderCard(
                      genderIcon: Icons.female,
                      genderLabel: "FEMALE",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              onPress: () {},
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "HEIGHT",
                    style: kLabelStyle,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        selectedHeight.toString(),
                        style: kNumberTextStyle,
                      ),
                      const Text(
                        "cm",
                        style: kLabelStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      overlayColor: const Color(0x15EB1555),
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 15),
                      thumbColor: const Color(0xFFEB1555),
                      overlayShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 25),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: const Color(0xFF8D8E98),
                    ),
                    child: Slider(
                        value: selectedHeight.toDouble(),
                        min: 120,
                        max: 220,
                        onChanged: (newValue) {
                          setState(() {
                            selectedHeight = newValue.round();
                          });
                        }),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {},
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: kLabelStyle,
                        ),
                        Text(
                          selectedWeight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundIconButton(
                              icon: Icons.remove,
                              onPress: () {
                                setState(() {
                                  selectedWeight--;
                                });
                              },
                            ),
                            RoundIconButton(
                              onPress: () {
                                setState(() {
                                  selectedWeight++;
                                });
                              },
                              icon: Icons.add,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {},
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: kLabelStyle,
                        ),
                        Text(
                          selectedAge.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RoundIconButton(
                              icon: Icons.remove,
                              onPress: () {
                                setState(() {
                                  selectedAge--;
                                });
                              },
                            ),
                            RoundIconButton(
                              onPress: () {
                                setState(() {
                                  selectedAge++;
                                });
                              },
                              icon: Icons.add,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            onPress: () {
              Brains brain =
                  Brains(weight: selectedWeight, height: selectedHeight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmi: brain.calculate(),
                    interpretation: brain.interpretation(),
                    resultText: brain.result(),
                  ),
                ),
              );
            },
            title: "CALCULATE",
          ),
        ],
      ),
    );
  }
}
