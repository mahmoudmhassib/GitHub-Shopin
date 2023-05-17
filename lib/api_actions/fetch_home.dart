import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shop_in/api_actions/api_models.dart';

//TODO:fetch all data

Future<List<Product>> fetchData()async{
  final String URL='https://my-chirt-app.onrender.com/products';
  final response=await http.get(Uri.parse(URL));
  if(response.statusCode==200){
    List jsondecode=json.decode(response.body);
    return jsondecode.map((data) =>Product.fromJson(data) ).toList();
}else{
    throw Exception('there is error in loading data');
}
}

//TODO:fetch  data by id

Future<Product> fetchDataById(int id)async{
  final URL='https://my-chirt-app.onrender.com/products/$id';
  final response=await http.get(Uri.parse(URL));
  if(response.statusCode==200){
    Map<String,dynamic> jsondecode=json.decode(response.body);
    return Product.fromJson(jsondecode);
  }else{
    throw Exception('error in loading data by id');
  }
}