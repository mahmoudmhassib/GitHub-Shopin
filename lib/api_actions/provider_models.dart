
import 'package:flutter/material.dart';

import 'api_models.dart';
import 'fetch_home.dart';

class ProviderProduct extends ChangeNotifier{
  List<Product> _products=[];

  //TODO:Getter
 List<Product> get Products => _products;
 Future<void> fetchAllProduct()async{
   final response=await fetchData();
   _products=response;
 }

  Product fetchProductById(int id)=>_products.firstWhere((element) => element.id==id);
}