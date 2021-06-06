import 'package:flutter/material.dart';

class Loading extends StatelessWidget{

  String loading_text = "Carregando ...";

  //Loading ( { Key key }) : super( key : key );

  @override 
  Widget build( BuildContext context ){
    return (
      SizedBox( 
        width: double.infinity, 
        height: 120,
        child: Card(  
          margin: EdgeInsets.all(25),   
          child: Center( 
              child: Container( 
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>
                    [
                      Expanded(
                        flex: 1,  
                        child: Image.asset(
                            'assets/loading.gif',
                            width: 30,
                            height:30
                          ), 
                      ), 
                      Expanded(
                        flex: 4, 
                        child: Text(  
                          this.loading_text, style: TextStyle(fontSize: 16, color: Colors.blueGrey ),
                        ),
                      ) 
                    ],
                ) 
              ),
            )
        )  
      )
    ); 
  }
}