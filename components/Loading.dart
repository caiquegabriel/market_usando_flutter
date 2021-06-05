import 'package:flutter/material.dart';

class Loading extends StatelessWidget{

  String loading_text = "Carregando ...";

  //Loading ( { Key key }) : super( key : key );

  @override 
  Widget build( BuildContext context ){
    return (
      Text( 'Carregando ... Aguarde.' )
    ); 
  }
}