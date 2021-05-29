import 'package:flutter/material.dart';

class ViewProducts extends StatefulWidget{
  final List products;

  ViewProducts( { Key key , @required this.products } ) : super( key : key );

  @override 
  _ViewProducts createState() => new _ViewProducts();
}

class _ViewProducts extends State<ViewProducts>{

  
  void view_product( int product_id ){
    debugPrint(' Vendo produto #' + product_id.toString()  );
  }
  /*
    Função para exibir as os produtos.
  */
  dynamic _display_products(){ 

    List <Card> products_cards = [];

    var size = MediaQuery.of(context).size;  

    for( var i = 0; i < widget.products.length; i++ ){ 

      var product = widget.products[i];

      products_cards.add(
        Card(  
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          color: Colors.white,
          margin: new EdgeInsets.all(15.0),
          child: Container(  
            child: GestureDetector(
              onTap: (){ this.view_product( product.id ); },
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
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(width: 1.5, color: Colors.lightBlue.shade900),
                          )
                        ),
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
                  ],
                )
              ),
            ), 
          ),
        ),
      );
    } 

    debugPrint( 'first ?');

    return products_cards;
  }

  
  @override 
  Widget build( BuildContext context ){ 

    var size = MediaQuery.of(context).size;  

    return Container(
      child: GridView.count(
        crossAxisCount: 1, 
        childAspectRatio: (size.width / 400 ),
        children: this._display_products(),
      )
    );
  }
}