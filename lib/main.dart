import 'package:bmi_calculator/controllers/weight_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view/first_page.dart';

void main(){
  runApp(const BMIcal());
}

class BMIcal extends StatelessWidget {
  const BMIcal({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>WeightProvider()),
        ChangeNotifierProvider(create: (context)=>AgeProvider()),
        ChangeNotifierProvider(create: (context)=>HeightProvider()),
        ChangeNotifierProvider(create: (context)=>GenderProvider())
      ],
      child: const MaterialApp(
        home: FirstPage(),
        debugShowCheckedModeBanner: false,
        // routes: {
        //   "/": (context)=> const FirstPage(),
        // },
      ),
    );
  }
}
