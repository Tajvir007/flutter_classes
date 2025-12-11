import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  const Input({super.key});

  @override
  Widget build(BuildContext context) {

    // The controllers to retrieve the input values from the TextFields
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("User Input"),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            // Flutter Logo Image
            Image.network("https://docs.flutter.dev/assets/images/docs/ui/adaptive-responsive/platforms.png"),

            Image.asset('asset/java.png'),



            // Name Input Field
            TextField(

              controller: nameController, // controller is used to retrieve the input value from the TextField

              keyboardType: TextInputType.name,

              decoration: InputDecoration( // InputDecoration is used to decorate the TextField

                prefixIcon: Icon(Icons.man), // prefixIcon is used to add an icon at the beginning of the TextField
                prefixIconColor: Colors.blue,
                suffixIcon: Icon(Icons.check),
                suffixIconColor: Colors.green,

                border: OutlineInputBorder( // OutlineInputBorder is used to create a border around the TextField
                  borderRadius: BorderRadius.circular(20)
                ),

                enabledBorder: OutlineInputBorder( // enabledBorder is used to create a border when the TextField is enabled
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.green,
                    width: 2
                  )
                ),

                focusedBorder: OutlineInputBorder( // focusedBorder is used to create a border when the TextField is focused
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2
                  )
                ),

                filled: true, // filled is used to fill the background color of the TextField

                contentPadding: EdgeInsets.all(20), // contentPadding is used to add padding inside the TextField


                hintText: "Enter Name", // hintText is used to add a hint text inside the TextField
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 20
                ),

                helperText: "sejan", // helperText is used to add a helper text below the TextField
                helperStyle: TextStyle(
                  color: Colors.green,
                  fontSize: 10
                ),

                labelText: "Name", // labelText is used to add a label above the TextField
                labelStyle: TextStyle(
                  color: Colors.blue,
                  fontSize: 12
                ),

              ),
            ),

            // Phone Input Field
            TextField(
              controller: phoneController,

              keyboardType: TextInputType.number,
              maxLength: 11,

              decoration: InputDecoration( // InputDecoration is used to decorate the TextField

                prefixIcon: Icon(Icons.man), // prefixIcon is used to add an icon at the beginning of the TextField
                prefixIconColor: Colors.blue,
                suffixIcon: Icon(Icons.check),
                suffixIconColor: Colors.green,

                border: OutlineInputBorder( // OutlineInputBorder is used to create a border around the TextField
                    borderRadius: BorderRadius.circular(20)
                ),

                enabledBorder: OutlineInputBorder( // enabledBorder is used to create a border when the TextField is enabled
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                        color: Colors.green,
                        width: 2
                    )
                ),

                focusedBorder: OutlineInputBorder( // focusedBorder is used to create a border when the TextField is focused
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                        color: Colors.black,
                        width: 2
                    )
                ),

                filled: true, // filled is used to fill the background color of the TextField

                contentPadding: EdgeInsets.all(20), // contentPadding is used to add padding inside the TextField


                hintText: "Enter Phone",
                hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 20
                ),

                helperText: "017-xxxxx",
                helperStyle: TextStyle(
                    color: Colors.green,
                    fontSize: 10
                ),

                labelText: "Phone",
                labelStyle: TextStyle(
                    color: Colors.blue,
                    fontSize: 12
                ),

              ),
            ),

            // Password Input Field
            TextField(
              controller: passwordController,

              //keyboardType: TextInputType.visiblePassword,
              maxLength: 11, // maxLength is used to set the maximum length of the input

              obscureText: true, // obscureText is used to hide the text input (for password fields)

              decoration: InputDecoration( // InputDecoration is used to decorate the TextField

                prefixIcon: Icon(Icons.man), // prefixIcon is used to add an icon at the beginning of the TextField
                prefixIconColor: Colors.blue,
                suffixIcon: Icon(Icons.check),
                suffixIconColor: Colors.green,

                border: OutlineInputBorder( // OutlineInputBorder is used to create a border around the TextField
                    borderRadius: BorderRadius.circular(20)
                ),

                enabledBorder: OutlineInputBorder( // enabledBorder is used to create a border when the TextField is enabled
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                        color: Colors.green,
                        width: 2
                    )
                ),

                focusedBorder: OutlineInputBorder( // focusedBorder is used to create a border when the TextField is focused
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                        color: Colors.black,
                        width: 2
                    )
                ),

                filled: true, // filled is used to fill the background color of the TextField

                contentPadding: EdgeInsets.all(20), // contentPadding is used to add padding inside the TextField


                hintText: "Enter Password",
                hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 20
                ),

                helperText: "Password must be 8 characters",
                helperStyle: TextStyle(
                    color: Colors.green,
                    fontSize: 10
                ),

                labelText: "Password",
                labelStyle: TextStyle(
                    color: Colors.blue,
                    fontSize: 12
                ),

              ),
            ),

            SizedBox(height: 10,),

            SizedBox(
              width: double.infinity, // make the button full width

              child: ElevatedButton(onPressed: (){

                print( // print the input values to the console
                  "Name: ${nameController.text}, Phone: ${phoneController.text}, Password: ${passwordController.text}"
                );

                nameController.clear(); // clear the name field after submission
                phoneController.clear(); // clear the phone field after submission
                passwordController.clear(); // clear the password field after submission

              }, child: Text("Submit",
              style: TextStyle(
                fontSize: 20,
                backgroundColor: Colors.orange,
              ),
              )),
            ),


          ],
        ),
      ),

    );
  }
}
