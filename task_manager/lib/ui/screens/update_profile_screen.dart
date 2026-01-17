import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task_manager/data/models/user_model.dart';
import 'package:task_manager/data/services/api_caller.dart';
import 'package:task_manager/data/utils/urls.dart';
import 'package:task_manager/ui/controller/auth_controller.dart';
import 'package:task_manager/ui/widgets/snack_bar.dart';
import 'package:task_manager/ui/widgets/task_manager_app_bar.dart';

import '../widgets/background_page_logo.dart';
import '../widgets/background_screen.dart';
import '../widgets/photo_picker.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {

  // 3. variable and function for upload image
  // Crate object of ImagePicker
final ImagePicker _imagePicker = ImagePicker();

XFile ? _selectedImage;

// Gallery থেকে image pick করার function
  Future<void> _pickImage() async {
    // Pick an image.
    final XFile? image = await _imagePicker.pickImage(source: ImageSource.gallery);

    if(image != null){
      // Load selected image to variable to load
      _selectedImage = image;
      setState(() {

      });
    }

  }



  // 1. Load user data
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController ? confirmPasswordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    UserModel user = AuthController.userModel!;

    emailController.text = user.email;
    firstNameController.text = user.firstName;
    lastNameController.text = user.lastName;
    phoneController.text = user.mobile;

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: TaskManagerAppBar(),

      body: BackgroundScreen(
        child: BackgroundPageLogo(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(

                key: _formKey,

                child: Column(

                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [

                    Text('Update Profile',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(height: 10,),

                    // Container for upload image
                    PhotoPicker(onTap: _pickImage, selectedImage: _selectedImage,),

                    SizedBox(height: 10,),
                    TextFormField(

                      controller: emailController,

                      decoration: InputDecoration(
                        hintText: 'Email',
                        labelText: 'Email',
                      ),
                      validator: (String ? value){
                        if(value == null || value.isEmpty){
                          return 'Email is required';
                        }

                        final emailRegularExpression = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                        if( ! emailRegularExpression.hasMatch(value)){
                          return 'please enter valid email';
                        }
                        return null;

                      },
                    ),

                    SizedBox(height: 10,),
                    TextFormField(

                      controller: firstNameController,

                      decoration: InputDecoration(
                        hintText: 'First Name',
                        labelText: 'First Name',
                      ),
                      validator: (String ? value){
                        if(value == null || value.isEmpty){
                          return 'Enter your first name';
                        }
                        if(value.trim().length < 2){
                          return 'First name must be at least 2 characters';
                        }
                        return null;

                      },
                    ),

                    SizedBox(height: 10,),
                    TextFormField(

                      controller: lastNameController,

                      decoration: InputDecoration(
                        hintText: 'Last Name',
                        labelText: 'Last Name',
                      ),
                      validator: (String ? value){
                        if(value == null || value.isEmpty){
                          return 'Enter your last name';
                        }
                        if(value.trim().length < 2){
                          return 'Last name must be at least 2 characters';
                        }
                        return null;

                      },
                    ),

                    SizedBox(height: 10,),
                    TextFormField(

                      controller: phoneController,

                      decoration: InputDecoration(
                        hintText: 'Phone',
                        labelText: 'Phone',
                      ),
                      validator: (String ? value){
                        if(value == null || value.isEmpty){
                          return 'Enter your phone number';
                        }
                        if(value.trim().length != 11){
                          return 'Enter a valid phone number';
                        }
                        return null;

                      },
                    ),

                    SizedBox(height: 10,),
                    TextFormField(

                      controller: passwordController,

                      decoration: InputDecoration(
                        hintText: 'Password',
                        labelText: 'Password',
                      ),
                      validator: (String ? value){
                        if(value == null || value.isEmpty){
                          return 'Enter your Password';
                        }
                        if(value.length <= 6){
                          return 'Password must be at least 6 characters';
                        }
                        return null;

                      },
                    ),

                    SizedBox(height: 10,),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Confirm Password',
                        labelText: 'Confirm Password',
                      ),
                    ),

                    SizedBox(height: 10,),
                    SizedBox(
                        width: double.infinity,
                        child: FilledButton(onPressed: (){

                          if(_formKey.currentState!.validate()){
                            updateProfile();
                          }

                        }, child: Icon(Icons.arrow_circle_right_outlined))
                    ),



                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }


  Future<void> updateProfile()async {

    isLoading = true;
    setState(() {

    });

    Map<String, dynamic> requestBody = {
      "email": emailController.text,
      "firstName": firstNameController.text,
      "lastName": lastNameController.text,
      "mobile": phoneController.text,

    };

    if(phoneController.text.isNotEmpty){
      requestBody['password'] = phoneController.text;
    }

    String ? encodedPhoto;

    if(_selectedImage != null){
      List<int> bytes = await _selectedImage!.readAsBytes(); // সিলেক্ট করা ছবিটাকে byte array (List<int>) এ কনভার্ট করা হচ্ছে।
      encodedPhoto = jsonEncode(bytes); // byte list টাকে JSON string এ রূপান্তর করা হচ্ছে। কারণ API তে সরাসরি byte পাঠানো যায় না
      requestBody['photo'] = encodedPhoto; // এখন এই encoded ছবিটা requestBody ম্যাপে "photo" key দিয়ে রাখা হচ্ছে
    }

    final ApiResponse response = await ApiCaller.postRequest(url: Urls.updateProfileUrl);

    isLoading = false;
    setState(() {

    });

    if(response.isSuccessful){
      UserModel model = UserModel(
          id: AuthController.userModel!.id,
          email: emailController.text,
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          mobile: phoneController.text,
        photo: encodedPhoto ?? AuthController.userModel!.photo,
      );


      AuthController.updateUserData(model);
      showSnackBarMessage(context, "Profile updated successfully");

    }else{
      showSnackBarMessage(context, response.errorMessage!);


    }

  }


}


