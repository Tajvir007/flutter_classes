import 'package:flutter/material.dart';
import 'package:flutter_classes/module%208/dashboard.dart';
import 'package:flutter_classes/module%208/home_2.dart';

import '../home.dart';

class TextForm extends StatelessWidget {
  const TextForm({super.key});

  @override
  Widget build(BuildContext context) {

    final _formKey = GlobalKey<FormState>(); // GlobalKey is used to identify the form

    TextEditingController phoneController = TextEditingController();

    return Scaffold(

      appBar: AppBar(
        title: Text("Text Form Page"),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),

      body:
      Form(

        key: _formKey, // key is used to identify the form

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(

            children: [
              Text("Phone Number"),
              TextFormField( // TextFormField is used to create a form field

                controller: phoneController, // controller is used to control the input text

                keyboardType: TextInputType.phone, // keyboardType is used to specify the type of input
                decoration: InputDecoration( // InputDecoration is used to decorate the TextFormField
                  hintText: "Enter your phone number",
                  labelText: "Phone",
                  border: OutlineInputBorder( // OutlineInputBorder is used to create a border around the TextFormField
                    borderRadius: BorderRadius.circular(10), // border radius
                    gapPadding: 10
                  ),

                  prefixIcon: Icon(Icons.phone),
                  prefixIconColor: Colors.green,

                ),

                // validator is used to validate the input
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "Phone number is required";
                  }else if(value.length != 11){
                    return "Phone number must be 11 digits";
                  }
                  else{
                    return null;
                  }
                },

              ),

              SizedBox(height: 20,), // SizedBox is used to add space between the form fields
              Text("Password"),
              TextFormField( // TextFormField is used to create a form field

                obscureText: true, // obscureText is used to hide the input text
                keyboardType: TextInputType.visiblePassword, // keyboardType is used to specify the type of input

                decoration: InputDecoration( // InputDecoration is used to decorate the TextFormField
                  hintText: "Enter your password",
                  labelText: "Password",
                  border: OutlineInputBorder( // OutlineInputBorder is used to create a border around the TextFormField
                      borderRadius: BorderRadius.circular(10), // border radius
                      gapPadding: 10
                  ),

                  

                  prefixIcon: Icon(Icons.phone),
                  prefixIconColor: Colors.green,

                ),

                // validator is used to validate the input
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "Password is required";
                  } else if(value.length < 6){
                    return "Password must be at least 6 characters";
                  } else{
                    return null;
                  }
                },

              ),
              
              SizedBox(height: 20,),

              // Button to submit the form
              SizedBox(
                width: double.infinity,
                  child: ElevatedButton(onPressed: (){

                    // Validate returns true if the form is valid, or false otherwise.
                    if(_formKey.currentState!.validate()){
                      /**
                       * 1. If the form is valid, navigate to the Home page
                       * 2. Navigator.pushReplacement is used to replace the current page with the new page
                       * 3. Navigator.push is used to push the new page on top of the current page
                       */
                      // Navigator.pushReplacement(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => Home())
                      //
                      // );

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Home())

                      );

                    }

                  }, child: Text("Submit"))),

              SizedBox(height: 20,),

              // Button to go to Home 2 page
              ElevatedButton(onPressed: (){

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Home2()));

              } , child: Text("Home 2")),

              // parameter pass test button to Dashboard page
              /**
               *  ElevatedButton(onPressed: (){

                  Navigator.push(
                  context,
                  MaterialPageRoute(
                  builder: (context) => Dashboard(phone: phoneController.text,)));

                  } , child: Text("Dashboard")),
               */


              //2. Name navigator test button
              ElevatedButton(onPressed: (){
                Navigator.pushNamed(context, 'input'); // navigate to Input page using named route
              }, child: Text("Name navigator -> Input page")),

              // Pass parameter using named navigator
              ElevatedButton(onPressed: (){
                Navigator.pushNamed(context, 'dashboard', arguments: {
                  'phone': phoneController.text,
                  'name': 'John Doe'
                }); // navigate to Dashboard page using named route with arguments
              }, child: Text("Dashboard -> Navigator data pass"))



            ],

          ),
        ),
      ),

    );
  }
}
