/*
  A página inicial
*/
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:market/services/Product.dart';
import 'package:market/views/ViewProducts.dart'; 

import 'components/Loading.dart';
import 'components/general/AppBar.dart';

class MainPage extends StatefulWidget{

  final title;

  MainPage( { Key key, this.title }) : super( key : key );

  @override
  _MainPage createState() => new _MainPage();
}


class _MainPage extends State<MainPage>{

  void first_view( Map container ){  
    this._current_view = Loading();
    Future<List> products = ProductService.fetch_products(); 
    products.then( (products) {  
      //Após 3s vai chamar o container
      Timer( Duration(seconds: 3),  () => container['change_view']( new ViewProducts( container: container , products : products )) );
    }); 
  }

  Widget _current_view = null;
  Map<String, dynamic> _container_value ;

  /*
    @Param (string) view_name : Nome da view.
  */
  void change_view( Widget view ){ 
    setState( () { 
      debugPrint('Mudando view para ' + view.toString() );
      _current_view = view;
    });
  }

  void set_container( String key , dynamic value ){
    this._container_value.update( key, value );
  }

  dynamic get_container( String key ){
    return this._container_value[key];
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

    //this.parent_functions()['change_view'](Text('...'));
    var j = Text( 'Oops!!');

    Timer( Duration(seconds: 3),  () => 
      setState((){
        debugPrint( 'Change !');
        j  = Text( 'Changed !');
      })
    );

    /*
      Vamos carregar a função primária do nosso APP
    */
    this.first_view( this.parent_functions() ); 

    return Scaffold(
      appBar: CustomAppBar() as Widget,
      body : this._current_view
    );
 }
}
