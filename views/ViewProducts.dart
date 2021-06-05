import 'package:flutter/material.dart';
import 'package:market/components/ProductTarget.dart';

import 'ViewProduct.dart';

class ViewProducts extends StatefulWidget{

  final List products;
  final Map container;

  ViewProducts( { Key key , this.container, this.products } ) : super( key : key );

  @override 
  _ViewProducts createState() => new _ViewProducts();
}

class _ViewProducts extends State<ViewProducts>{

  
  /*
    @Return (List) products_cards : Uma lista de Cards de produtos
  */
  dynamic _products(){ 

    //container['change_view'](new Loading());

    debugPrint('Carregando lista de produtos ...');

    List <Card> products_cards = [];

    var size = MediaQuery.of(context).size;  

    for( var i = 0; i < widget.products.length; i++ ){ 

      var product = widget.products[i]; 

      products_cards.add(
        Card(   
          margin: EdgeInsets.only( top:15, bottom: 30, left: 20, right: 20),
          elevation: 0,
          color: Colors.transparent,
          child: Container(   
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),  
            ),
            child: ClipRRect( 
              borderRadius: BorderRadius.circular(20), 
                
              child: 
                GestureDetector(
                onTap: (){ widget.container['change_view']( new ViewProduct( container: widget.container, product_id : product.id ) ); },
                child: SizedBox(  
                  width: double.infinity,
                  height: double.infinity,
                  child:  Column(
                    children: [ 
                      Container( 
                        margin: new EdgeInsets.only( bottom: 10 ),
                        child: 
                        Container( 
                          width: double.infinity, 
                          child:  
                            Image.asset(
                              'assets/default_product.png', 
                              height: 160,
                              fit:BoxFit.fill 
                            ), 
                        )
                      ), 
                      Padding( 
                        padding: EdgeInsets.all(10),
                        child: 
                          Column(
                            children: [
                              Container(
                                width: double.infinity,
                                child: 
                                  Text( 
                                      product.name , 
                                      style: TextStyle( fontSize:35, fontWeight: FontWeight.bold ),
                                      textAlign: TextAlign.left
                                  ), 
                              ),  
                              Container(  
                                margin: EdgeInsets.only( top: 7.5 ),
                                width: double.infinity, 
                                child: Row(   
                                  children: [
                                    SizedBox(  
                                      width: size.width/2.5,
                                      child:  Align(
                                        alignment: Alignment.centerLeft,
                                        child: Column(  
                                          children: [ 
                                            Text( 
                                              'R\$ ' + product.price.toString(),
                                              style: TextStyle( 
                                                fontSize: 30, 
                                                color: Colors.black,   
                                              ),  
                                            ),
                                            Text( 
                                                '3x de ' + ( product.price/3 ).toStringAsFixed(2) , 
                                                style: TextStyle( 
                                                  fontSize:15 , 
                                                  color: Colors.blueGrey, 
                                                ) ,  
                                                textAlign: TextAlign.left
                                            ),
                                          ],
                                        ),  
                                      ),
                                    ),
                                    SizedBox(  
                                      width: size.width/2.5,
                                      child: Text(
                                        'Nota 4.3/5' ,
                                        style: TextStyle( 
                                          fontSize: 20, 
                                          color: Colors.blueGrey[200],   
                                        ), 
                                        textAlign: TextAlign.right,
                                      ),
                                    ), 
                                  ],
                                )
                              ), 
                            ],
                          ),
                      ),
                      Container( 
                        child: new ProductTarget( name : product.name, id: product.id )
                      ),
                    ],
                  )
                ),
              ), 
            ),
          ),
        ),
      );
    }  

    return products_cards;
  }
  
  @override 
  Widget build( BuildContext context ){ 

    var size = MediaQuery.of(context).size;  

    debugPrint('ViewProducts');

    return Container(
      child: GridView.count(
        crossAxisCount: 1, 
        childAspectRatio: ( size.width / 400 ),
        children: this._products(),
      )
    );
  }
}