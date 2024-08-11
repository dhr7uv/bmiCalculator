import 'package:bmi_calculator/controllers/weight_provider.dart';
import 'package:bmi_calculator/utils/calculate_button.dart';
import 'package:bmi_calculator/utils/height_panel.dart';
import 'package:bmi_calculator/utils/gender_panel.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/utils/selectors.dart';
import 'package:provider/provider.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width =MediaQuery.of(context).size.width;

    return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: const Text("BMI Calculator",style: TextStyle(color: Colors.white),),
                backgroundColor: Colors.deepPurple.shade400,
                leading: const Icon(Icons.menu,color: Colors.white,),
              ),

              body: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Column(
                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Selectors(
                          title: "Age (in years)",
                          height: height/3.8,
                          width: width/2.5,
                          quantity: context.watch<AgeProvider>().agevalue,
                        ),
                        Selectors(
                          title: "Weight (kg)",
                          height: height/3.8,
                          width: width/2.5,
                          quantity: context.watch<WeightProvider>().wtvalue,
                        ),
                      ],
                    ),

                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: HeightPanel(
                          width: width,
                          height: height/4,
                          title: "Height",
                        ),
                      ),
                    ),

                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GenderPanel(
                          width: width,
                          height: height/4,
                          title: "Gender",
                        ),
                      ),
                    ),

                    const CalculateButton(),

                  ],
                ),
              )

          );
    }
}
