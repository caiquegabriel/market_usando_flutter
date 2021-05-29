import 'package:market/core/ServerApi.dart';
import 'package:market/entities/Product.dart';

class ProductService {



  static List<dynamic> fetch_products(){

    List products = [];

    var s = new ServerApi();
    s.url = '';  
    
    //Vamos colocar os produtos em um List de produtos
    s.fetch().then( (response) {
      for( var i = 0; i < response.length; i++){  

        Product p = new Product();
        p.id = response[i]['id'] ?? null;
        p.name = response[i]['name'] ?? null;
        p.price = response[i]['price'] ?? null;

        products.add(p); 
      }
    });

    return products;
  }


}