double division( double value , int installments, int precision ){
  double step1 = value / installments;   
  
  String step2 = step1.toStringAsFixed(precision);  

  double step3 = double.parse(step2);
  
  return step3;
}