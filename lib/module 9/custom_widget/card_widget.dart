import 'package:flutter/material.dart';

class cardWidget extends StatelessWidget {

  //
  final String img, title, rating;

  const cardWidget({
    super.key,
    required this.img, required this.title, required this.rating
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          // Stack Container with Image and Gradient Overlay
          Container(
            height: 250,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),

              image: DecorationImage(
                image: NetworkImage(img),
              ),

            ),

            child: Container(

              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.all(10),

              decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(20),

                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent, Colors.black54
                    ]
                ),
              ),
            ),

          ),

          // Positioned Text and Button
          Positioned(

            bottom: 3,
            left: 20,
            right: 10,

            child: Row(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Text(title,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),
                ),

                SizedBox(width: 10,),

                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        padding: EdgeInsets.all(5)
                    ),
                    onPressed: (){}, child: Text(rating))
              ],
            ),
          ),

        ],
      ),
    );
  }
}