import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResponsivePackage extends StatelessWidget {
  const ResponsivePackage({super.key});

  @override
  Widget build(BuildContext context) {

    // Change UI based on Orientation of Device
    // 1. Get the current orientation of the device using MediaQuery class
    final Orientation orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      appBar: AppBar(
        title: Text("Responsive Package"),
      ),

      body: Center(
        child: SingleChildScrollView(

          // 3. Change the scroll direction based on the orientation of the device
          scrollDirection: orientation == Orientation.landscape ? Axis.horizontal : Axis.vertical,

          // 2. Change the layout based on the orientation of the device
          child: orientation == Orientation.landscape ?
          Row(

            mainAxisAlignment: MainAxisAlignment.center,

            children: [

              Container(
                width: 200.r, // .r is used for radius adaptation
                height: 200.r,
                color: Colors.amber,
              ),

              Row(
                children: [
                  Container(
                    width: 0.5.sw, // .sw is used for screen width percentage
                    height: 200.h, // .h is used for height adaptation
                    color: Colors.red,
                    child: Text('My actual width ${0.5.sw}'
                        'My actual height ${200.h}'),
                  ),
                ],
              ),

              // Using flutter_screenutil package for responsive design
              Container(
                height: 200.h,
                width: 200.w,
                color: Colors.blue,
              ),
              SizedBox(height: 10.h,),
              Text('Responsive',
                style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal
                ),),

              // Without using flutter_screenutil package
              SizedBox(height: 10.h,),
              Container(
                height: 200,
                width: 200,
                color: Colors.green,
              ),
              SizedBox(height: 10,),
              Text('Responsive',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.green
                ),)

            ],
          ) :
          Column(
          
            mainAxisAlignment: MainAxisAlignment.center,
          
            children: [

              Container(
                width: 200.r, // .r is used for radius adaptation
                height: 200.r,
                color: Colors.amber,
              ),
          
              Row(
                children: [
                  Container(
                    width: 0.5.sw, // .sw is used for screen width percentage
                    height: 200.h, // .h is used for height adaptation
                    color: Colors.red,
                    child: Text('My actual width ${0.5.sw}'
                        'My actual height ${200.h}'),
                  ),
                ],
              ),
          
              // Using flutter_screenutil package for responsive design
              Container(
                height: 200.h,
                width: 200.w,
                color: Colors.blue,
              ),
              SizedBox(height: 10.h,),
              Text('Responsive',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: Colors.teal
              ),),
          
              // Without using flutter_screenutil package
              SizedBox(height: 10.h,),
              Container(
                height: 200,
                width: 200,
                color: Colors.green,
              ),
              SizedBox(height: 10,),
              Text('Responsive',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.green
                ),)
          
            ],
          ),
        ),
      ),

    );
  }
}
