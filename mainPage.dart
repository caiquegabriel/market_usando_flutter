/*
  A página inicial
*/
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:market/services/Product.dart';
import 'package:market/views/ViewProduct.dart';
import 'package:market/views/ViewProducts.dart'; 

import 'components/Loading.dart';
import 'components/general/AppBar.dart';

class MainPage extends StatefulWidget{

  bool first_loaded = false;
  final title;
  Widget _current_view;
  Map<String, dynamic> _container_value ;

  MainPage( { Key key, this.title }) : super( key : key );


  @override
  _MainPage createState() => new _MainPage();
}


class _MainPage extends State<MainPage>{

  void first_view( Map container ){  
    Future<List> products = ProductService.fetch_products(); 

    //Vamos exibir o loading
    container['change_view'](Loading()); 

    products.then( (products) { 
      container['change_view']( new ViewProducts( container: container , products : products ));  
      //container['change_view']( new ViewProduct( container: container, product_id : 1 ) );
    });  
  } 

  void set_container( String key , dynamic value ){
    widget._container_value.update( key, value );
  }

  dynamic get_container( String key ){
    return widget._container_value[key];
  }

  /*
    @Param (string) view_name : Nome da view.
  */
  void change_view( Widget view ){ 
    setState( () { 
      widget._current_view = view;
    });
  }

  Map parent_functions(){
    Map<String, Function> functions ;

    functions = {
      'get_container' : this.get_container,
      'set_container' : this.set_container,
      'change_view'   : this.change_view
    }; 

    return functions;
  } 

  @override 
  void initState(){
    super.initState(); 
  }  

  @override 
  Widget build ( BuildContext context ){  

    /*
      Se for false, vamos carregar a tela inicial.
    */
    if( widget.first_loaded == false ){
      this.first_view( this.parent_functions() ); 
      widget.first_loaded = true; 
    }
     

    debugPrint('#'+widget._current_view.toString());
    
    return Scaffold(
      appBar: CustomAppBar() as Widget,
      body : Container( 
        child: widget._current_view
      )
    );
 }
}
