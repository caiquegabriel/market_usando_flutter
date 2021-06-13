import 'package:flutter/material.dart';

class Back extends StatelessWidget{

  Widget CWidget;
  String text;

  Back ( { Key key , @required this.CWidget , @required this.text } ) : super( key : key );

  @override 
  Widget build( BuildContext context ){
    return Row( 
      children: [
        TextButton(
          child: 
            Row( 
              children: [
                Icon(Icons.arrow_back),
                Text( 
                  'Voltar', 
                  style: TextStyle( fontSize: 22 ),
                )
              ],
          ),
          onPressed: () { 
            Navigator.push( 
              context , 
              MaterialPageRoute( 
                builder: (context) => this.CWidget
              )
            );
          }  
        )
      ],
    );
  }

} 