import 'package:flutter/material.dart';

class WeightProvider extends ChangeNotifier{
   int wtvalue;

   WeightProvider({
      this.wtvalue=65
   });

   void setQuantity(int quantity){
      wtvalue = quantity;
      notifyListeners();
   }

   double get getWeight{
      var sw = wtvalue.toString();
      var weight  = double.parse(sw);
      return weight;
   }

}
class AgeProvider extends ChangeNotifier{
   int agevalue;

   AgeProvider({
      this.agevalue=18
   });

   void setQuantity(int quantity){
      agevalue = quantity;
      notifyListeners();
   }
}

class HeightProvider extends ChangeNotifier{
   int feets;
   int inches;
   var height;

   HeightProvider({
      this.feets = 5,
      this.inches= 1,
      this.height= ""
   });

   void setFeets (int quantity){
      feets = quantity;
      notifyListeners();
   }
   void setInches (int quantity){
      inches = quantity;
      notifyListeners();
   }
   // void setHeight(){
   //    height = "$feets.$inches";
   //    notifyListeners();
   // }
   //
   // double get getHeight {
   //    var intheight = double.parse(height);
   //    return intheight;
   // }

}

class GenderProvider extends ChangeNotifier{
   bool gender;

   GenderProvider({
      this.gender = false
});

   void setGender(value){
      gender = value;
      notifyListeners();
   }

}