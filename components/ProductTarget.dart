import 'package:flutter/material.dart';

class ProductTarget extends StatelessWidget{ 

  String name = null; 
  int id = 0;

  ProductTarget( {Key key, this.name , this.id } ) : super(key: key);

  @override 
  Widget build( BuildContext context ){ 

    if( this.id % 2 > 0 ){
      return Text('');
    }  
    return  Align(  
      alignment: Alignment.centerLeft,
      child: Container(   
        constraints: BoxConstraints(
          maxWidth: double.infinity,
        ),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.lightBlue ,  
          border: Border.all( width: 1, color: Colors.lightBlue[300]),
          borderRadius: BorderRadius.circular(10.0),
        ), 
        padding: EdgeInsets.all(10), 
        child: Text( 
          'Em promoção',
          style: TextStyle( 
            color: Colors.white,
            fontSize:15.5,
            fontWeight: FontWeight.bold
          )
        )
      )
    );
       
  }
}