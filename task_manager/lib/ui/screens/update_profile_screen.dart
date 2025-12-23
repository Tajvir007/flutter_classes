import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundScreen(
        child: BackgroundPageLogo(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
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
                    decoration: InputDecoration(
                      hintText: 'Email',
                      labelText: 'Email',
                    ),
                  ),

                  SizedBox(height: 10,),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'First Name',
                      labelText: 'First Name',
                    ),
                  ),

                  SizedBox(height: 10,),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Last Name',
                      labelText: 'Last Name',
                    ),
                  ),

                  SizedBox(height: 10,),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Phone',
                      labelText: 'Phone',
                    ),
                  ),

                  SizedBox(height: 10,),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Password',
                      labelText: 'Password',
                    ),
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

                      }, child: Icon(Icons.arrow_circle_right_outlined))
                  ),



                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


