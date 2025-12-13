import 'package:flutter/material.dart';
import 'package:flutter_classes/module%2013/BMI%20Calculator/widget/custom_input_field.dart';

/**
 *
 */
// 1. enum: is used to define a set of constants. It is used to define a set of values that are related to each other.
enum HeightType{cm, feetInch}

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({super.key});

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {

  // 2. State Variable: currently selected height type.  শুরুতে default value = cm
  HeightType? _heightType = HeightType.cm;

  /**
   * ************************** 3. BMI Calculation ******************************
   * 1. Initialize variable
   * 2. Convert all input to double. Then convert into meter
   * 3. Calculate BMI
   * 4. Catagorise BMI into underweight, normal, overweight, obese
   * 5. Display result in setState() and call function in it
   */
  // 3.1. Initialize variable
  TextEditingController _weightController = TextEditingController();
  TextEditingController _cmController = TextEditingController();
  TextEditingController _feetController = TextEditingController();
  TextEditingController _inchController = TextEditingController();

  String _bmiResult = '';
  String? category;

  double? cmToMeter(){
    final cm = double.tryParse(_cmController.text.trim()); // trim() → extra space কাটে

    if(cm == null || cm < 0) return null;
    return cm/100;
  }

  double? feetInchToMeter(){
    final feet = double.tryParse(_feetController.text.trim());
    final inch = double.tryParse(_inchController.text.trim());

    if(feet == null || feet < 0 || inch == null || inch < 0){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Invalid Input')));
      return null;
    }

    final totalInch = (feet * 12) + inch;
    if(totalInch <= 0){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Invalid Input')));
      return null;
    }

    final meter = totalInch * 0.0254;
    return meter;
  }

  void calculateBMI(){

final weight = double.tryParse(_weightController.text.trim());
if(weight == null || weight <= 0){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Invalid Input')));
  return null;
}

final meterType = _heightType == HeightType.cm ? cmToMeter() : feetInchToMeter();
if(meterType == null){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Invalid Input')));
  return null;
}

final BMI = weight / (meterType * meterType);
final cat = categoryResult(BMI);



setState(() {
  _bmiResult = BMI.toStringAsFixed(2);
  category = cat;
});

  }

  String categoryResult(double BMI){
    if(BMI < 18.5) return "Under Weight";
    if(BMI < 25) return "Normal";
    if(BMI < 30) return "Over Weight";
    return "Obese";
  }


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
              controller: _weightController,
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
                controller: _cmController,
                textInputType: TextInputType.number,
              ),
            ] else...[
              Row(
                children: [
                  Expanded(
                    child: InputField(
                      labelText: 'Enter Feet',
                      controller: _feetController,
                      textInputType: TextInputType.number,
                    ),
                  ),
                  SizedBox(width: 8,),
                  Expanded(
                    child: InputField(
                      labelText: 'Enter Inch',
                      controller: _inchController,
                      textInputType: TextInputType.number,
                    ),
                  ),
                ],
              ),
            ],

            SizedBox(height: 16,),
            
            ElevatedButton(onPressed: (){
              calculateBMI();
            },
                child: Text('Calculate BMI')),

            SizedBox(height: 16,),

            Text('Your BMI is: $_bmiResult'),
            SizedBox(height: 16,),
            Text('Your BMI is: $category'),

          ],
        ),
      ),
    );
  }
}


