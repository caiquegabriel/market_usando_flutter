import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import "package:http/http.dart" as http;
import 'package:http/io_client.dart';

class ServerApi{
    
    String _url;
    String _method;
    Object _headers;

    set url ( String url ){
      this._url = url;
    }

    set headers ( dynamic headers ){
      this._headers = headers;
    }

    set method ( String method ){
      this._method = method == 'post' ? method : 'get';
    }

    get method => () { 
      return this._method == 'post' ? 'post' : 'get';
    };

    Future<List<dynamic>> fetch() async{
      debugPrint( 'Conectando a ' + this._url );

      final ioc = new HttpClient();

      /*
        Não esquecer de remover após a produção!
      */
      ioc.badCertificateCallback = (X509Certificate cert, String host, int port) => true;

      final http = new IOClient(ioc);

//https://192.168.64.2/market_backend/index.php
      final String final_url = Uri.parse( 'https://caiquegabriel.com/flutter/index.php' + this._url ).toString();
      var response    = null;
     
      switch( this.method ) {
        case 'post':
          response = await http.post( final_url , body: {}, headers: this._headers );
          break;
        case 'get':
          response = await  http.get( final_url, headers: this._headers );
        break;
        default: 
          response = await  http.post( final_url, body: {} , headers: this._headers );
        break;
      }  

      if( response.statusCode == 200 ){
        return jsonDecode(response.body) as List<dynamic> ;
      }else{
        throw new Exception ( 'Falha ao conectar com o serviço em ' +  final_url );
      } 

    }
    
}