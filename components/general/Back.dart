import 'package:flutter/material.dart';

class Back extends StatelessWidget{

  Widget CWidget;
  String text;

  Back ( { Key key , @required this.CWidget , @required this.text } ) : super( key : key );

  @override 
  Widget build( BuildContext context ){
    return Container( 
      padding: EdgeInsets.all(3), 
      decoration: BoxDecoration(
        color: Colors.yellow[900],
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            width: 0.6,
          ),
          top: BorderSide(
            color: Colors.grey,
            width: 0.6,
          ),
        ), 
      ), 
      child: Row(  
        children: [
        TextButton(
          child: 
            Row( 
              children: [
                Padding(
                    child: Icon(Icons.arrow_back, color: Colors.white ),
                    padding: EdgeInsets.all(5),
                ),
                Text( 
                  'Voltar', 
                  style: TextStyle( fontSize: 22, color: Colors.white),
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
      )
    );
  }

} 