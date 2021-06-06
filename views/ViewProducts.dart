import 'package:flutter/material.dart';
import 'package:market/components/ProductCard.dart';
import 'package:market/entities/Product.dart';

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

    List <Widget> products_cards = []; 

    for( var i = 0; i < widget.products.length; i++ ){ 

      var product = widget.products[i]; 

      var pCard = ProductCard( container: widget.container , product: product );
      products_cards.add(pCard);
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
        children: this._products(),
      )
    );
  }
}