double round( double value , int precision ){
  double step1 = value / precision;   
  
  String step2 = step1.toStringAsFixed(3);  

  double step3 = double.parse(step2);
  
  return step3;
}