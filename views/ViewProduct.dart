import 'package:flutter/material.dart';

class ViewProduct extends StatelessWidget{

  String loading_text = "Carregando ...";
  final Map container; 
  final int product_id ;

  ViewProduct ( { Key key , @required this.container , @required this.product_id}) : super( key : key );

  @override 
  Widget build( BuildContext context ){
    return (
      Container( 
        child:  Text('Vendo product...')
      )
    );
    
  }
}