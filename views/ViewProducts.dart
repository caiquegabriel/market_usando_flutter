import 'package:flutter/material.dart';

class ViewProducts extends StatefulWidget{
  final List products;

  ViewProducts( { Key key , @required this.products } ) : super( key : key );

  @override 
  _ViewProducts createState() => new _ViewProducts();
}

class _ViewProducts extends State<ViewProducts>{

  

  dynamic _load_products(){ 

    List <Card> products_cards = [];

    for( var i = 0; i < widget.products.length; i++ ){ 

      var product = widget.products[i];

      products_cards.add(
        Card(
          color: Colors.purple[200],
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child:  Column(
                children: [
                  Text( 
                    product.name , 
                    style: TextStyle( fontSize:22, fontWeight: FontWeight.bold ), 
                    textAlign: TextAlign.center
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 3, 
                        child: Text('R\$ ' + product.price.toString() ),
                      )
                    ],
                  )
                ]
              )
            ),
          ),
        );
    } 

    debugPrint( 'first ?');

    return products_cards;
  }

  
  @override 
  Widget build( BuildContext context ){
    return Container(
      child: GridView.count(
        crossAxisCount: 2,
        children: this._load_products(),
      )
    );
  }
}