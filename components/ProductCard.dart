import 'package:flutter/material.dart';
import 'package:market/entities/Product.dart';
import 'package:market/components/ProductTarget.dart';
import 'package:market/views/ViewProduct.dart';

class ProductCard extends StatefulWidget{

  final Product product;
  final Map container;

  ProductCard( { Key key , @required this.container, @required this.product }) : super( key : key );

  @override 
  _ProductCard createState() => _ProductCard();
}


class _ProductCard extends State<ProductCard>{


  @override 
  Widget build( BuildContext context ){

    final product = widget.product;

    var size = MediaQuery.of(context).size;  

    Widget get_thumbnail(){
      if( product.image_thumbnail == null ){
          return Image.asset(
            'assets/default_product.png', 
            height: 160,
            fit:BoxFit.fill 
          );
        }else{
          return Image.network(
            product.image_thumbnail,
            height: 160,
            fit: BoxFit.cover
          );
        }
    }

    return Card( 
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
                          (
                            get_thumbnail()
                          )
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
                                                product.installment_number.toString() + 'x de R\$ ' + ( product.installment_value() ).toString() , 
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
                        //child: new ProductTarget( name : product.name, id: product.id )
                      ),
                    ],
                  )
                ),
              ), 
            ),
          ),
        );
  }

}