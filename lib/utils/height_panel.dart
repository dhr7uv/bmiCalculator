import 'package:bmi_calculator/utils/shifter_buttons.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/weight_provider.dart';

class HeightPanel extends StatefulWidget {
  HeightPanel({
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
  State<HeightPanel> createState() => _HeightPanelState();
}

class _HeightPanelState extends State<HeightPanel> {


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

    var feet = context.watch<HeightProvider>().feets;
    var inch = context.watch<HeightProvider>().inches;

    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: shadows
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     Padding(
            //       padding: const EdgeInsets.only(right: 8.0,top: 8.0),
            //       child: Container(
            //         width: 125,
            //         height: 35,
            //         decoration: BoxDecoration(
            //           color: Colors.deepPurple.shade100,
            //           borderRadius: BorderRadius.circular(30)
            //         ),
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: [
            //             const Text("ft",style: TextStyle(fontSize: 17),),
            //             Transform.scale(
            //               scale: 0.7,
            //               child: Switch(
            //                 value: isSelected,
            //                 onChanged: (value){
            //                   setState(() {
            //                     isSelected = value;
            //                   });
            //                   },
            //               ),
            //             ),
            //             const Text("cm",style: TextStyle(fontSize: 17),),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Shifters(
                  text: "$feet\'",
                  onTap: (){
                    if(feet==8){
                      feet=1;
                      context.read<HeightProvider>().setFeets(feet);
                    }else{
                      feet++;
                      int newVal=feet;
                      context.read<HeightProvider>().setFeets(newVal);
                    }
                  },
                ),
                const SizedBox(width: 40,),
                Shifters(
                  text: "$inch\"",
                  onTap: (){
                    if(inch==12){
                      inch=1;
                      context.read<HeightProvider>().setInches(inch);
                    }else{
                      inch++;
                      int newVal =inch;
                      context.read<HeightProvider>().setInches(newVal);
                    }
                  },
                )
              ],
            )
          ]

      ),
    );
  }
}
