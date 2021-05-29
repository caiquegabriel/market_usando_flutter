import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
    CustomAppBar({Key key}) : preferredSize = Size.fromHeight(kToolbarHeight), super(key: key);

    @override
    final Size preferredSize; // default is 56.0

    @override
    _CustomAppBar createState() => _CustomAppBar ();
}

class _CustomAppBar  extends State<CustomAppBar>{

    @override
    Widget build(BuildContext context) {
        return 
          AppBar( 
            backgroundColor: Colors.white,
            title: Text('Caique market'),
            leading:  
              Row(  
                  //mainAxisSize: MainAxisSize.min,   
                  children: [
                    Container(
                      margin: EdgeInsets.all(5),
                      constraints: BoxConstraints(
                        maxHeight: 55,
                        maxWidth: 55,
                        minHeight: 40,
                        minWidth: 40
                      ), 
                      decoration: BoxDecoration(
                        color: Colors.pink ,
                        borderRadius: BorderRadius.circular(100)
                      ),
                      child: 
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: 
                            Image.network('https://media-exp1.licdn.com/dms/image/C4E03AQEvIwPpfIdm2A/profile-displayphoto-shrink_800_800/0/1602984752629?e=1627516800&v=beta&t=l3kHccThSYIrJWN1uc7aXWxP5AE-PC087gIfMzuPXe0')
                        )
                    ),
                  ]  
            ),
            elevation: 0, 
            actions: [
              //Pedidos
              IconButton(
                icon: const Icon(Icons.shopping_basket),
                tooltip: 'Pedidos',
                onPressed: () {
                  // handle the press
                },
                color: Colors.black
              ),
              //Mensagens
              IconButton(
                icon: const Icon(Icons.message_outlined),
                tooltip: 'Mensagens',
                onPressed: () {
                  // handle the press
                },
                color: Colors.black
              ), 
              //Buscar produto
              IconButton(
                icon: const Icon(Icons.search),
                tooltip: 'Buscar',
                onPressed: () {
                  // handle the press
                },
                color: Colors.black
              ),
               
            ],
          );
    }
}