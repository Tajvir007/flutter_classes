import 'package:flutter/material.dart';
import 'package:flutter_classes/module%209/custom_widget/card_widget.dart';
import 'package:flutter_classes/module%209/stack_flutter.dart';

import '../button.dart';
import 'list.dart';

class Ownwidget extends StatelessWidget {
  const Ownwidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Own Widget"),
      ),

      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            SingleChildScrollView(

              scrollDirection: Axis.horizontal,

              child: Row(

                mainAxisAlignment: MainAxisAlignment.center,

                children: [

                  cardWidget(img: 'https://www.icimod.org/wp-content/uploads/2019/12/DSC_0119.jpg', title: 'Bangladesh', rating: '5.0',),
                  cardWidget(img: 'https://studying-in-uk.org/wp-content/uploads/2019/05/study-in-london-1068x641.jpg', title: 'London', rating: '5.5',),
                  cardWidget(img: 'https://content.skyscnr.com/m/17facff22bc5efda/original/GettyImages-138160482_doc.jpg', title: 'Canade', rating: '5.1',),
                  cardWidget(img: 'https://t3.ftcdn.net/jpg/02/65/64/24/360_F_265642486_IXw9DQVzjTfAzT8xMtTBXBvYD8Who6Fw.jpg', title: 'India', rating: '4.0',),

                ],
              ),
            ),

            SizedBox(height: 10,),
            // Animation Button
            ElevatedButton(onPressed: (){
              Navigator.push(context, PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) => Button(),
              // Main Animation
                transitionsBuilder: (context, animation, secondaryAnimation, child){
                    const begin = Offset(1, 0); // 1,0 means start from right side
                    const end = Offset.zero; // 0,0 means no offset
                    const curve = Curves.ease; // ease, bounceIn, elasticIn etc.
                    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                    
                    return SlideTransition(position: animation.drive(tween), child: child);
                }
              ));
            }, child: Text("Previous Page")),

          ],
        ),
      ),

    );
  }
}
