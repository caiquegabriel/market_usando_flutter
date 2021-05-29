class Product {

  String _name;
  double _price;
  int    _id;

  Product(){}

  set id ( var id ) { 
    if( id.runtimeType.toString() == 'int' )
      this._id = id;
  }

  set price ( var price ) { 
    if( price.runtimeType.toString() == 'double' )
      this._price = price;
  }

  set name ( var name ) { 
    if( name.runtimeType.toString() == 'String' )
      this._name = name;
  } 

  get name =>  this._name;

  get id   => this._id;

  get price => this._price;

}