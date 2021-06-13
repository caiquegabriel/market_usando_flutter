
import 'package:flutter/material.dart';
import 'package:market/components/general/Back.dart';
import 'package:market/mainPage.dart';

class ViewProduct extends StatelessWidget{

  String loading_text = "Carregando ...";
  final Map container; 
  final int product_id ;

  ViewProduct ( { Key key , @required this.container , @required this.product_id}) : super( key : key );

  @override 
  Widget build( BuildContext context ){
    return (
      Container( 
        child: 
          Column(
            children: [
              Container(
                child: new Back( CWidget: MainPage() , text : 'Voltar' )
              ),
              Container(
                child: Text('Vendo produto x'),
              )
            ],
          )
      )
    );
    
  }
}