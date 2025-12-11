import 'package:flutter/material.dart';

class BuildButton extends StatelessWidget {

  String text;
  Color ? color;
  final VoidCallback onClick;

   BuildButton({
    super.key,

     required this.onClick,
     required this.text,
     this.color
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(18),
            backgroundColor: color ?? Colors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: onClick,
          child: Text(text,
            style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.bold
            ),),),
      ),
    );
  }
}