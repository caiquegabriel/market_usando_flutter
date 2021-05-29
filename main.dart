import 'package:flutter/material.dart';
import 'package:market/services/Product.dart';
import 'package:market/views/ViewProducts.dart'; 

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData( 
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}


class MyHomePage extends StatefulWidget{

  final title;

  MyHomePage( { Key key, this.title }) : super( key : key );

  @override
  _MyHomePage createState() => new _MyHomePage();
}


class _MyHomePage extends State<MyHomePage>{

  Widget load( Map container ){ 

    List products = ProductService.fetch_products(); 

    container['change_view']( new ViewProducts( products : products ) ); 
    
    debugPrint( 'Produtos carregados ...');

    return Text( 'Empty ');
  }

  Widget _current_view = null;
  Map<String, dynamic> _container_value ;

  /*
    @Param (string) view_name : Nome da view.
  */
  void change_view( Widget view ){ 
    setState( () { 
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
   return Scaffold(
      appBar: AppBar( 
       title: Text(widget.title),
      ),
      body : Container(
       child:   this._current_view ?? this.load( this.parent_functions() ), 
      ),
   );
 }
}
