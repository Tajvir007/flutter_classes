import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiCall extends StatefulWidget {
  const ApiCall({super.key});

  @override
  State<ApiCall> createState() => _ApiCallState();
}

class _ApiCallState extends State<ApiCall> {

  // 3. Call API
  /**
   * 1. Take list of products from API to store products in list
   * 2. Display list of products in GridView
   * 3. Call a function to fetch products from API
   */
  List products = [];
  bool isLoading = true;

// 5. initState will be called when the widget is first created.
// .In initState() function, call the fetchProducts() function.
  @override
 void initState(){
    super.initState();
    fetchProducts();
  }


  Future<void> fetchProducts() async { // This function will fetch products from API

    /**
     * ******************** Fetch Data ***********************
     * 1. Create a variable to store the URL of the API
     * 2. Load data from the API using http.get() function. Store the response in a variable
     * 3. If the response is successful, parse the JSON data using jsonDecode() function. Store the parsed data in a variable.
     */

    final url = Uri.parse('http://35.73.30.144:2008/api/v1/ReadProduct');
    final response = await http.get(url); // await: is used to wait for the response from the API

    // Debug to see the response from the API in console. It will show the status code and the body of the response.
    print(response.statusCode);
    print(response.body);

    if(response.statusCode == 200){
      final jsonResponse = jsonDecode(response.body);

      // 4. Update the UI using setState() function
      setState(() {
        products = jsonResponse['data']; // data is the key in the JSON response. It contains the list of products from the API.
        isLoading = false; // isLoading is used to show/hide the loading indicator. It is set to false when the API call is successful.
      });

    } else{
      setState(() {
        isLoading = false;
      });
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Call'),
      ),

      // 6. Update dynamic data in UI design
      body: isLoading ? Center(child: CircularProgressIndicator()) : GridView.builder(
        itemCount: products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
                  crossAxisSpacing: 10,
            childAspectRatio: 1
          ),
          itemBuilder: (context, index){

          final item = products[index]; //

          return Card(
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 140, 
                    child: Image.network(item["Img"]),
                  ),
                  // 1. Product Name
                  Text(
                    item['ProductName'],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis, // ellipsis is used to show three dots when the text is too long.
                  ),
                  // 2. Product Price and Quantity
                  Text(
                    'Price: ${item['UnitPrice']} | QTY: ${item['Qty']}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey
                    ),
                  ),
                ],
              ),
            ),
          );
          }),

    );
  }
}
