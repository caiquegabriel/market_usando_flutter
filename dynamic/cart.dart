import 'package:flutter/material.dart';

class Cart {

  List items = [];

  void set_item ( Object item ){ 
    items.add( item );
    debugPrint( 'Inserindo um item. Atualmente temos '+this.items.length.toString()+' itens.');
  }

  List get_items(){
    return this.items;
  }


}