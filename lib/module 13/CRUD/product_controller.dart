import 'dart:convert';

import 'package:flutter_classes/module%2013/CRUD/model/product_model.dart';
import 'package:flutter_classes/module%2013/CRUD/utils/urls.dart';
import 'package:http/http.dart' as http;

class ProductController{

  List<Data>products = [];
  bool isLoading = true;

  Future<void> fetchProducts()async {

    // get response from API using http.get() function. Store the response in a variable
    final response = await http.get(Uri.parse(Urls.readProduct)); // await: is used to wait for the response from the API

    if(response.statusCode == 200){

      isLoading = false;
      // decode json and create a model. Then pass the decoded data into model
      final data = jsonDecode(response.body);

      ProductModel model = ProductModel.fromJson(data);

      // keep the data into a list
      products = model.data ?? [];

    }

  }


  // C1. Create product
Future<bool> createProduct(Data data) async {
    final response = await http.post(Uri.parse(Urls.createProduct),

    // C1.1 Add headers to the request to tell the server that we are sending json data to the server and not form data to the server (optional)
        headers: {
      'Content-Type' : 'application/json'
        },

    // After getting response from API data will gather in body. To create product we have to encode the data into json format
      body: jsonEncode(
        {

          "ProductName": data.productName,
          "ProductCode": DateTime.now().microsecondsSinceEpoch, // It will generate a unique code for each product
          "Img": data.img,
          "Qty": data.qty,
          "UnitPrice": data.unitPrice,
          "TotalPrice": data.totalPrice,

        }
      ),

    );
    print(response.body); // debug response to see error if any

  if(response.statusCode == 200){
    return true;
  }else{
    return false;
  }

}


  // D1. Product delete
Future<bool> deleteProduct(String productId) async {
    final response = await http.get(Uri.parse(Urls.deleteProduct(productId)));
    print(response.body); // debug response to see error if any

    if(response.statusCode == 200){
      return true; // if product is deleted, return true
    }
    else{
      return false; // if product is not deleted, return false
    }

}


}