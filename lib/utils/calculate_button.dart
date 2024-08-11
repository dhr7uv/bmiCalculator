import 'package:bmi_calculator/controllers/weight_provider.dart';
import 'package:bmi_calculator/view/bmi_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalculateButton extends StatefulWidget {
  const CalculateButton({super.key});

  @override
  State<CalculateButton> createState() => _CalculateButtonState();
}

class _CalculateButtonState extends State<CalculateButton> {

  @override
  Widget build(BuildContext context) {

    var height = "${(context).watch<HeightProvider>().feets}.${(context).watch<HeightProvider>().inches}";
    var weight = "${(context).watch<WeightProvider>().wtvalue}";
    bool gender = (context).watch<GenderProvider>().gender;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: ElevatedButton(
          onPressed: (){
           var bmi = convertVal(double.parse(height), double.parse(weight));
            showModalBottomSheet(
              constraints: const BoxConstraints.expand(height: 350),
              context: context,
              builder: (context) {
                return BmiIndicator(bmi: bmi, gender: gender);
            },);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
          ),
          child: const Text("CALCULATE",style: TextStyle(color: Colors.white),)
      ),
    );
  }

  double convertVal(double q1 , double weighd) {
    var height = q1 * 0.3048;
    var bmi = weighd / (height * height);
    return bmi;
  }

}

