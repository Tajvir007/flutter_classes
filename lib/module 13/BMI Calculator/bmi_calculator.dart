import 'package:flutter/material.dart';
import 'package:flutter_classes/module%2013/BMI%20Calculator/widget/custom_input_field.dart';

/**
 *
 */
// enum: is used to define a set of constants. It is used to define a set of values that are related to each other.
enum HeightType{cm, feetInch}

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({super.key});

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {

  //
  HeightType? _heightType = HeightType.cm;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        child: ListView(
          children: [
            // ********************* Weight Unit ****************
            Text("Weight Unit"),
            InputField(
              labelText: 'Enter your weight in (kg)',
              controller: TextEditingController(),
              textInputType: TextInputType.number,
            ),

            SizedBox(height: 10,),

            // ********************* Select height type ****************
            Text("Select height type"),
            // Segmented Button: is used to select one option from a set of options. It is used to select a single option from a set of options.
            SegmentedButton<HeightType>(
                segments: [

                  ButtonSegment<HeightType>(
                    label: Text('CM'),
                      value: HeightType.cm
                  ),
                  ButtonSegment<HeightType>(
                      label: Text('Feet Inch'),
                      value: HeightType.feetInch
                  ),

                ],
                selected: {_heightType!}, // _heightType! — এখানে ! মানে null না সেটা নিশ্চিত করা
            onSelectionChanged: (value){
                  setState(() {
                    _heightType = value.first; // user যা select করেছে, value এর ভিতরে সেটা থাকে | কিন্তু value একটা list/set, তাই .first দিয়ে প্রথম element নেওয়া হচ্ছেতারপর _heightType ভ্যারিয়েবলে store করা হচ্ছে
                  });
            },
            ),
            SizedBox(height: 10,),

            // ********************* Height Unit ****************
            Text("Height Unit"),
            SizedBox(height: 5,),
            if(_heightType == HeightType.cm)...[
              InputField(
                labelText: 'Enter height (in CM)',
                controller: TextEditingController(),
                textInputType: TextInputType.number,
              ),
            ] else...[
              Row(
                children: [
                  Expanded(
                    child: InputField(
                      labelText: 'Enter Feet',
                      controller: TextEditingController(),
                      textInputType: TextInputType.number,
                    ),
                  ),
                  SizedBox(width: 8,),
                  Expanded(
                    child: InputField(
                      labelText: 'Enter Inch',
                      controller: TextEditingController(),
                      textInputType: TextInputType.number,
                    ),
                  ),
                ],
              ),
            ]

          ],
        ),
      ),
    );
  }
}


