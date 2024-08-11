import 'package:bmi_calculator/controllers/weight_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GenderPanel extends StatefulWidget {
  GenderPanel({
    super.key,
    required this.title,
    required this.width,
    required this.height,
    hulk
  });

  final String title;
  final double width;
  final double height;
  List<Widget> hulk = [];

  @override
  State<GenderPanel> createState() => _GenderPanelState();
}

class _GenderPanelState extends State<GenderPanel> {


  List<BoxShadow> shadows = [
    const BoxShadow(
        offset: Offset(0, 2),
        blurRadius: 3,
        color: Colors.black38
    )
  ];

  bool isSelected = false;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: shadows
      ),
      child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0,right: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("I'm",style: TextStyle(fontSize: 65,fontWeight: FontWeight.bold, color: Colors.black54),),
                  const Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Text("Male",style: TextStyle(fontSize: 20),),
                  ),
                  Transform.scale(
                    scale: 0.8,
                    child: Switch(
                        value: isSelected,
                        onChanged: (value) {
                          setState(() {
                            isSelected = value;
                            (context).read<GenderProvider>().setGender(value);
                          });
                        },
                    ),
                  ),
                  const Text("Female",style: TextStyle(fontSize: 20),)
                ],
              ),
            )

          ]
      ),
    );
  }
}
