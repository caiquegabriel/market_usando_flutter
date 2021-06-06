import 'package:market/core/helpers.dart';

class Product {

  String _name;
  String _description;
  double _price;
  double _installment_value;
  int   _installment_number;
  int    _id;
  String _image_thumbnail;

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

  set description ( var description ){
    if( name.runtimeType.toString() == 'String' )
      this._description = description;
  }

  set image_thumbnail( var image_thumbnail ){
    if( image_thumbnail.runtimeType.toString() == 'String' )
      this._image_thumbnail = image_thumbnail;
  }

  set installment_number ( var installment_number ){
    if( installment_number.runtimeType.toString() == 'int' )
      this._installment_number = installment_number;
  }

  get name =>  this._name;

  get id   => this._id;

  get price => this._price ?? 0.001; 

  get descripiton => this._description;

  get installment_number => this._installment_number ?? 1;

  get image_thumbnail    => this._image_thumbnail;

  double installment_value(){
    if( this.price == null || this._installment_number == null || this.price == 0 || this._installment_number < 1 ){
      return 0;
    }else{ 
      return round(price, this._installment_number);
    }
  }

}