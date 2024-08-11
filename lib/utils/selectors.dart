import 'package:bmi_calculator/controllers/weight_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Selectors extends StatefulWidget {
  Selectors({
    super.key,
    required this.title,
    required this.width,
    required this.height,
    required this.quantity,
  });

  final String title;
  final double width;
  final double height;
  int quantity;

  @override
  State<Selectors> createState() => _SelectorsState();
 }

class _SelectorsState extends State<Selectors> {


  List<BoxShadow> shadows = [
    const BoxShadow(
        offset: Offset(0, 2),
        blurRadius: 3,
        color: Colors.black38
    )
  ];

  void increase(int quantity){
    quantity++;
    widget.quantity = quantity;
    if(widget.title.length==11){
      context.read<WeightProvider>().setQuantity(widget.quantity);
    }else if(widget.title.length==14){
      context.read<AgeProvider>().setQuantity(widget.quantity);
    }

    // print(widget.title.length);
  }

  void decrease(int quantity){
    quantity--;
    widget.quantity = quantity;
    if(widget.title.length==11){
      context.read<WeightProvider>().setQuantity(widget.quantity);
    }else if(widget.title.length==14){
      context.read<AgeProvider>().setQuantity(widget.quantity);
    }
  }



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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                Text(
                  widget.quantity.toString(),
                  style: const TextStyle(fontSize: 50),
                ),

                Row(
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          backgroundColor: Colors.deepPurple
                        ),
                        onPressed: ()=> increase(widget.quantity),
                        child: const Icon(Icons.add,color: Colors.white,)
                    ),

                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            backgroundColor: Colors.deepPurple
                        ),
                        onPressed: ()=> decrease(widget.quantity),
                        child: const Icon(Icons.minimize,color: Colors.white,)
                    ),
                  ],
                )
              ],
            ),

        );
  }
}
