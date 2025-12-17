import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_classes/module%2013/CRUD/product_controller.dart';
import 'package:http/http.dart' as http;

import 'model/product_model.dart';

class Crud extends StatefulWidget {
  const Crud({super.key});

  @override
  State<Crud> createState() => _CrudState();
}

class _CrudState extends State<Crud> {
  // r1. ProductController object
  ProductController productController = ProductController();

  // 5. initState will be called when the widget is first created.
  // .In initState() function, call the fetchProducts() function.
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  // r2. Create a function to fetch data from API and update the UI
  Future fetchData() async {
    // Create a object and fetch data
    await productController.fetchProducts();
    if(mounted){
      setState(() {

      });
    }
  }


  // 2. Dialog for adding and editing new product.
  productDialog(){

    TextEditingController productNameController = TextEditingController();
    TextEditingController productImgController = TextEditingController();
    TextEditingController productPriceController = TextEditingController();
    TextEditingController productQtyController = TextEditingController();
    TextEditingController productTotalPriceController = TextEditingController();



    showDialog(context: context, builder: (context) => AlertDialog( // showDialog for adding and editing new product
      title: Text("Add Product"),
      content: SingleChildScrollView(
        child: Column( // content for designing the dialog
          mainAxisSize: MainAxisSize.min, // min size for dialog content
          children: [
        
            TextField(
              controller: productNameController,
              decoration: InputDecoration(
                labelText: "Product Name"
              ),
            ),
            SizedBox(height: 10,),
        
            TextField(
              controller: productImgController,
              decoration: InputDecoration(
                  labelText: "Image "
              ),
            ),
            SizedBox(height: 10,),
        
            TextField(
              controller: productTotalPriceController,
              decoration: InputDecoration(
                  labelText: "Product Code"
              ),
            ),
            SizedBox(height: 10,),
        
            TextField(
              controller: productQtyController,
              decoration: InputDecoration(
                  labelText: "QTY"
              ),
            ),
            SizedBox(height: 10,),
        
            TextField(
              controller: productPriceController,
              decoration: InputDecoration(
                  labelText: "Unit Price"
              ),
            ),
            SizedBox(height: 10,),
        
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(onPressed: (){
                  Navigator.pop(context);
                }, child: Text('Cancel')),
                ElevatedButton(onPressed: () async {
                  // C2. As the button is assign to create product so we have to create a object and pass the data to the createProduct() function
                  productController.createProduct(Data( // As Data is in model.dart, we need to create a object
        
                    productName: productNameController.text,
                    img: productImgController.text,
                    qty: int.parse(productQtyController.text),
                    unitPrice: int.parse(productPriceController.text),
                    totalPrice: int.parse(productTotalPriceController.text),
        
                  ));
                  await fetchData();
                  Navigator.pop(context);
        
                }, child: Text('Save')),
              ],
            ),
        
          ],
        ),
      ),
    ));

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('API Call')),

      // 6. Update dynamic data in UI design
      body: productController.isLoading // Dynamic: used productController to
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
              itemCount: productController.products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                childAspectRatio: 1,
              ),
              itemBuilder: (context, index) {
                final item = productController.products[index]; // r. dynamic

                return Card(
                  child: Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 140,
                          child: Image.network(item.img.toString()), // dynamic
                        ),
                        // 1. Product Name
                        Text(
                          item.productName.toString(),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          overflow: TextOverflow
                              .ellipsis, // ellipsis is used to show three dots when the text is too long.
                        ),
                        // 2. Product Price and Quantity
                        Text(
                          'Price: ${item.unitPrice.toString()} | QTY: ${item.qty.toString()}',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),

                        // 1. Button for edit and delete
                        Row(

                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                          children: [
                            IconButton(onPressed: (){
                              productDialog();
                            }, icon: Icon(Icons.edit), color: Colors.orange,),
                            // D2. Product delete
                            IconButton(onPressed: () async {
                             // (MANDATORY) productController.deleteProduct(item.sId.toString());
                              // D3. (OPTIONAL) Delete product from API and check if it is deleted or not
                              await productController.deleteProduct(item.sId.toString()).then((value) async {
                                if(value){

                                  await fetchData(); // it will refresh the page after deleting the product

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Item deleted'))
                                  );
                                }else{
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text('Something went wrong!.............'))
                                  );
                                }
                              });
                              
                            }, icon: Icon(Icons.delete), color: Colors.red,),
                          ],
                        ),

                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
