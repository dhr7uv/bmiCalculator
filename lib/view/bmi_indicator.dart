import'package:flutter/material.dart';
import 'package:gauge_indicator/gauge_indicator.dart';


class BmiIndicator extends StatefulWidget {

  final double bmi;
  final bool gender;

  const BmiIndicator({
    super.key,
    required this.bmi,
    required this.gender
  });

  @override
  State<BmiIndicator> createState() => _BmiIndicatorState();
}

class _BmiIndicatorState extends State<BmiIndicator> {

  var msg = "";

  void checkermale(double bmi){
    if(bmi<18.5){
      msg = "(Underweight)";
    }else if(bmi>25.5){
      msg = "(Overweight)";
    }else{
      msg = "(Normal)";
    }
  }

  void checkerfemale(double bmi){
    if(bmi<18.5){
      msg = "(Underweight)";
    }else if(bmi>25.5){
      msg = "(Overweight)";
    }else{
      msg = "(Normal)";
    }
  }

  void checkGender(double bmi,bool gender){
    if(gender == false){
      checkermale(bmi);
    }else if(gender == true){
      checkerfemale(bmi);
    }
  }

  @override
  Widget build(BuildContext context) {

    checkGender(widget.bmi,widget.gender);
     double bmi = widget.bmi;

    return Scaffold(
      backgroundColor: Colors.deepPurple.shade600,
      body: SafeArea(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(onPressed: ()=>Navigator.pop(context), icon: const Icon(Icons.cancel,color: Colors.white,))
                  ],
                ),
                const Text(
                  "Your BMI is :",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white
                  )
                ),
                const SizedBox(height: 10),
                Text(
                    "${bmi.toStringAsFixed(2)} kg/m²",
                    style: const TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    )
                ),
                const SizedBox(height: 20),
                AnimatedRadialGauge(
                  duration: const Duration(seconds: 2),
                  curve: Curves.elasticOut,
                  radius: 150,
                  value: bmi,
                  axis: const GaugeAxis(
                    min: 0,
                    max: 50,
                    degrees: 180,
                    style: GaugeAxisStyle(
                      thickness: 20,
                      background: Color(0xFFDFE2EC),
                      segmentSpacing: 4,
                    ),
                    progressBar: GaugeProgressBar.rounded(
                      color: Colors.transparent
                    ),
                    segments: [
                      GaugeSegment(
                        from: 0,
                        to: 18.5,
                        color: Colors.yellow,
                      ),
                      GaugeSegment(
                        from: 18.5,
                        to: 25,
                        color: Colors.green,
                      ),
                      GaugeSegment(
                        from: 25,
                        to: 30,
                        color: Colors.orange,
                      ),
                      GaugeSegment(
                          from: 30,
                          to: 50,
                        color: Colors.red
                      )
                    ]
                  ),
                  builder: (context, child, value)=> Center(
                      child: Text(
                        msg,
                        style: const TextStyle(fontSize:20, color: Colors.white),
                      )
                  ),
                ),
              ],
            )
          ),
        ),
      ),
    );
  }
}