import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PhotoPicker extends StatelessWidget {
  const PhotoPicker({
    super.key, required this.onTap, this.selectedImage,
  });


  // 2. Variables for upload image
  final VoidCallback onTap; // It will be used to upload image
  final XFile ? selectedImage; // It will hold the selected image. And it will be used to show selected image



  @override
  Widget build(BuildContext context) {

    // 1. UI design for upload image
    return InkWell(
      onTap: onTap,
      child: Container(

        width: double.maxFinite,
        height: 50,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5)
        ),

        child: Row(
          children: [
            Container(

              child: Text('Photo',
                style: TextStyle(
                    color: Colors.white
                ),),
              alignment: Alignment.center,

              width: 80,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10)
                ),
              ),
            ),

            Text(selectedImage == null
            ? "No photo selected"
                : selectedImage!.name,
              style: TextStyle(
                overflow: TextOverflow.ellipsis,
              ),
              maxLines: 1,
            ),

          ],
        ),
      ),
    );
  }
}