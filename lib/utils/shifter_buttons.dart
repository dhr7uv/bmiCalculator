import'package:flutter/material.dart';

class Shifters extends StatelessWidget {
  const Shifters({
    super.key,
    required this.text,
    required this.onTap,
  });

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 120,
      height: 70,
      decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text,style: const TextStyle(fontSize: 40,fontWeight: FontWeight.bold,color: Colors.black45),),
          const SizedBox(width: 15.0,),
          InkWell(
            onTap: onTap,
            child: const Icon(Icons.arrow_upward,size: 25,)
          )
        ],
      ),
    );
  }
}